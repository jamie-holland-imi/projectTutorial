DEVICE = STM32G071xx
FLASH  = 0x08000000

USE_ST_CMSIS = true
USE_ST_HAL = true

STM32_BASE_PATH   ?= .

# STM32-base sub-folders
BASE_LINKER   = $(STM32_BASE_PATH)/STM32G071RBTX_FLASH
#BASE_MAKE     = $(STM32_BASE_PATH)/make
BASE_STARTUP  = $(STM32_BASE_PATH)/Core/Startup

# Standard values for project folders
BUILD_FOLDER ?= ./Build
SRC_FOLDER ?= ./Core/Src
INC_FOLDER ?= ./Core/Inc

# Include the series-specific makefile
SERIES_CPU  = cortex-m4
SERIES_ARCH = armv7e-m+fp
MAPPED_DEVICE = STM32G071xx

# The toolchain path, defaults to using the globally installed toolchain
ifdef TOOLCHAIN_PATH
    TOOLCHAIN_SEPARATOR = /
endif

TOOLCHAIN_PATH      ?=
TOOLCHAIN_SEPARATOR ?=
TOOLCHAIN_PREFIX    ?= arm-none-eabi-

CC      = $(TOOLCHAIN_PATH)$(TOOLCHAIN_SEPARATOR)$(TOOLCHAIN_PREFIX)gcc
CXX     = $(TOOLCHAIN_PATH)$(TOOLCHAIN_SEPARATOR)$(TOOLCHAIN_PREFIX)g++
LD      = $(TOOLCHAIN_PATH)$(TOOLCHAIN_SEPARATOR)$(TOOLCHAIN_PREFIX)ld -v
AR      = $(TOOLCHAIN_PATH)$(TOOLCHAIN_SEPARATOR)$(TOOLCHAIN_PREFIX)ar
AS      = $(TOOLCHAIN_PATH)$(TOOLCHAIN_SEPARATOR)$(TOOLCHAIN_PREFIX)gcc
OBJCOPY = $(TOOLCHAIN_PATH)$(TOOLCHAIN_SEPARATOR)$(TOOLCHAIN_PREFIX)objcopy
OBJDUMP = $(TOOLCHAIN_PATH)$(TOOLCHAIN_SEPARATOR)$(TOOLCHAIN_PREFIX)objdump
SIZE    = $(TOOLCHAIN_PATH)$(TOOLCHAIN_SEPARATOR)$(TOOLCHAIN_PREFIX)size


# Flags - Overall Options
CPPFLAGS += -specs=nosys.specs

# Flags - C Language Options
CFLAGS += -ffreestanding

# Flags - C++ Language Options
CXXFLAGS += -fno-exceptions
CXXFLAGS += -fno-unwind-tables

# Flags - Warning Options
CPPFLAGS += -Wall
#CPPFLAGS += -Wextra

# Flags - Debugging Options
CPPFLAGS += -g

# Flags - Optimization Options
CPPFLAGS += -ffunction-sections
CPPFLAGS += -fdata-sections

# Flags - Preprocessor options
CPPFLAGS += -D $(MAPPED_DEVICE)
CPPFLAGS += -D DEBUG

# Flags - Assembler Options
ifneq (,$(or USE_ST_CMSIS, USE_ST_HAL))
    CPPFLAGS += -Wa,--defsym,CALL_ARM_SYSTEM_INIT=1
endif

# Flags - Linker Options
# CPPFLAGS += -nostdlib
CPPFLAGS += -Wl,-T"$(BASE_LINKER).ld"

# Flags - Directory Options
CPPFLAGS += -I$(INC_FOLDER)
CPPFLAGS += -I$(BASE_STARTUP)

# Flags - Machine-dependant options
CPPFLAGS += -mcpu=$(SERIES_CPU)
CPPFLAGS += -march=$(SERIES_ARCH)
CPPFLAGS += -mlittle-endian
CPPFLAGS += -mthumb
CPPFLAGS += -masm-syntax-unified

# Output files
BUILD_ARTIFACT_NAME := stm32_executable
ELF_FILE_NAME ?= $(BUILD_ARTIFACT_NAME).elf
BIN_FILE_NAME ?= stm32_bin_image.bin
OBJ_FILE_NAME ?= startup_$(MAPPED_DEVICE).o
HEX_FILE_NAME ?= $(BUILD_ARTIFACT_NAME).hex
MAP_FILES ?= $(BUILD_ARTIFACT_NAME).map

ELF_FILE_PATH += $(BUILD_FOLDER)/$(ELF_FILE_NAME)
BIN_FILE_PATH += $(BUILD_FOLDER)/$(BIN_FILE_NAME)
OBJ_FILE_PATH += $(BUILD_FOLDER)/$(OBJ_FILE_NAME)
HEX_FILE_PATH += $(BUILD_FOLDER)/$(HEX_FILE_NAME)
MAP_FILE_PATH += $(BUILD_FOLDER)/$(MAP_FILES)

# Input files
SRC ?=
SRC += $(SRC_FOLDER)/*.c

# Startup file
DEVICE_STARTUP = $(BASE_STARTUP)/startup_stm32g071rbtx.s

# Include the CMSIS files, using the HAL implies using the CMSIS
ifneq (,$(or USE_ST_CMSIS, USE_ST_HAL))
    CPPFLAGS += -I$(STM32_BASE_PATH)/Drivers/CMSIS/Device/ST/STM32G0xx/Include
    CPPFLAGS += -I$(STM32_BASE_PATH)/Drivers/CMSIS/Include

    #SRC += $(STM32_BASE_PATH)/Drivers/CMSIS/Device/ST/STM32G0xx/Source/*.c
endif

# Include the HAL files
ifdef USE_ST_HAL
    CPPFLAGS += -D USE_HAL_DRIVER
    CPPFLAGS += -I$(STM32_BASE_PATH)/Drivers/STM32G0xx_HAL_Driver/Inc

    # A simply expanded variable is used here to perform the find command only once.
    HAL_SRC := $(shell find $(STM32_BASE_PATH)/Drivers/STM32G0xx_HAL_Driver/Src/*.c ! -name '*_template.c')
    SRC += $(HAL_SRC)
endif

# Make all
all: main-build

main-build: $(BIN_FILE_NAME) secondary-outputs

$(BIN_FILE_NAME): $(ELF_FILE_NAME)
	$(OBJCOPY) -O binary $^ $@

$(ELF_FILE_NAME): $(SRC) $(OBJ_FILE_PATH) | $(BUILD_FOLDER)
	$(CC) $(CPPFLAGS) $(CXXFLAGS) $^ -o $@

$(OBJ_FILE_PATH): $(DEVICE_STARTUP) | $(BUILD_FOLDER)
	$(CC) -c $(CPPFLAGS) $(CXXFLAGS) $^ -o $@

$(HEX_FILE_NAME): $(ELF_FILE_NAME) | $(BUILD_FOLDER)
	$(OBJCOPY) -O ihex $^ $@

$(BUILD_FOLDER):
	mkdir -p $(BUILD_FOLDER)

# Make clean
#clean:
	#rm -f $(ELF_FILE_PATH) $(BIN_FILE_PATH) $(OBJ_FILE_PATH) $(HEX_FILE_PATH)

secondary-outputs: $(ELF_FILE_NAME) $(HEX_FILE_NAME)

.PHONY: all clean main-build
