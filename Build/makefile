################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: Arm GNU Toolchain
################################################################################

-include ../makefile.init
-include ../makefile.targets
-include ../makefile.defs

RM := rm -rf

# All of the sources participating in the build are defined here
-include sources.mk
-include compsubdir.mk
-include objects.mk

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(S_DEPS)),)
-include $(S_DEPS)
endif
ifneq ($(strip $(S_UPPER_DEPS)),)
-include $(S_UPPER_DEPS)
endif
ifneq ($(strip $(C_DEPS)),)
-include $(C_DEPS)
endif
endif

# The toolchain path, defaults to using the globally installed toolchain
ifdef TC_PATH
    TC_SEP = /
endif

TC_PATH ?=
TC_SEP ?=
CC = $(TC_PATH)$(TC_SEP)arm-none-eabi-gcc

OPTIONAL_TOOL_DEPS := \
$(wildcard ../makefile.defs) \
$(wildcard ../makefile.init) \
$(wildcard ../makefile.targets) \

BUILD_ARTIFACT_NAME := ProjectTutorial
BUILD_ARTIFACT_EXTENSION := elf
BUILD_ARTIFACT_PREFIX :=
BUILD_ARTIFACT := $(BUILD_ARTIFACT_PREFIX)$(BUILD_ARTIFACT_NAME)$(if $(BUILD_ARTIFACT_EXTENSION),.$(BUILD_ARTIFACT_EXTENSION),)

# Add inputs and outputs from these tool invocations to the build variables 
EXECUTABLES += \
$(BUILD_ARTIFACT_NAME).elf \

MAP_FILES += \
$(BUILD_ARTIFACT_NAME).map \

SIZE_OUTPUT += \
default.size.stdout \

OBJDUMP_LIST += \
$(BUILD_ARTIFACT_NAME).list \

OBJCOPY_HEX += \
$(BUILD_ARTIFACT_NAME).hex \

# All Target
all: main-build

# Main-build Target
main-build: objects $(BUILD_ARTIFACT_NAME).elf secondary-outputs

objects:
	$(CC) -c -o "../Drivers/STM32G0xx_HAL_Driver/Src/stm32g0xx_hal.c" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32G071xx -c -I../Core/Inc -I../Drivers/STM32G0xx_HAL_Driver/Inc -I../Drivers/STM32G0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32G0xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Drivers/STM32G0xx_HAL_Driver/Src/stm32g0xx_hal.d" -MT"Drivers/STM32G0xx_HAL_Driver/Src/stm32g0xx_hal.o" --specs=nano.specs -mfloat-abi=soft -mthumb -o "Drivers/STM32G0xx_HAL_Driver/Src/stm32g0xx_hal.o"
	$(CC) -c -o "../Drivers/STM32G0xx_HAL_Driver/Src/stm32g0xx_hal_cortex.c" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32G071xx -c -I../Core/Inc -I../Drivers/STM32G0xx_HAL_Driver/Inc -I../Drivers/STM32G0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32G0xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Drivers/STM32G0xx_HAL_Driver/Src/stm32g0xx_hal_cortex.d" -MT"Drivers/STM32G0xx_HAL_Driver/Src/stm32g0xx_hal_cortex.o" --specs=nano.specs -mfloat-abi=soft -mthumb -o "Drivers/STM32G0xx_HAL_Driver/Src/stm32g0xx_hal_cortex.o"
	$(CC) -c -o "../Drivers/STM32G0xx_HAL_Driver/Src/stm32g0xx_hal_dma.c" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32G071xx -c -I../Core/Inc -I../Drivers/STM32G0xx_HAL_Driver/Inc -I../Drivers/STM32G0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32G0xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Drivers/STM32G0xx_HAL_Driver/Src/stm32g0xx_hal_dma.d" -MT"Drivers/STM32G0xx_HAL_Driver/Src/stm32g0xx_hal_dma.o" --specs=nano.specs -mfloat-abi=soft -mthumb -o "Drivers/STM32G0xx_HAL_Driver/Src/stm32g0xx_hal_dma.o"
	$(CC) -c -o "../Drivers/STM32G0xx_HAL_Driver/Src/stm32g0xx_hal_dma_ex.c" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32G071xx -c -I../Core/Inc -I../Drivers/STM32G0xx_HAL_Driver/Inc -I../Drivers/STM32G0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32G0xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Drivers/STM32G0xx_HAL_Driver/Src/stm32g0xx_hal_dma_ex.d" -MT"Drivers/STM32G0xx_HAL_Driver/Src/stm32g0xx_hal_dma_ex.o" --specs=nano.specs -mfloat-abi=soft -mthumb -o "Drivers/STM32G0xx_HAL_Driver/Src/stm32g0xx_hal_dma_ex.o"
	$(CC) -c -o "../Drivers/STM32G0xx_HAL_Driver/Src/stm32g0xx_hal_exti.c" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32G071xx -c -I../Core/Inc -I../Drivers/STM32G0xx_HAL_Driver/Inc -I../Drivers/STM32G0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32G0xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Drivers/STM32G0xx_HAL_Driver/Src/stm32g0xx_hal_exti.d" -MT"Drivers/STM32G0xx_HAL_Driver/Src/stm32g0xx_hal_exti.o" --specs=nano.specs -mfloat-abi=soft -mthumb -o "Drivers/STM32G0xx_HAL_Driver/Src/stm32g0xx_hal_exti.o"
	$(CC) -c -o "../Drivers/STM32G0xx_HAL_Driver/Src/stm32g0xx_hal_flash.c" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32G071xx -c -I../Core/Inc -I../Drivers/STM32G0xx_HAL_Driver/Inc -I../Drivers/STM32G0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32G0xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Drivers/STM32G0xx_HAL_Driver/Src/stm32g0xx_hal_flash.d" -MT"Drivers/STM32G0xx_HAL_Driver/Src/stm32g0xx_hal_flash.o" --specs=nano.specs -mfloat-abi=soft -mthumb -o "Drivers/STM32G0xx_HAL_Driver/Src/stm32g0xx_hal_flash.o"
	$(CC) -c -o "../Drivers/STM32G0xx_HAL_Driver/Src/stm32g0xx_hal_flash_ex.c" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32G071xx -c -I../Core/Inc -I../Drivers/STM32G0xx_HAL_Driver/Inc -I../Drivers/STM32G0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32G0xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Drivers/STM32G0xx_HAL_Driver/Src/stm32g0xx_hal_flash_ex.d" -MT"Drivers/STM32G0xx_HAL_Driver/Src/stm32g0xx_hal_flash_ex.o" --specs=nano.specs -mfloat-abi=soft -mthumb -o "Drivers/STM32G0xx_HAL_Driver/Src/stm32g0xx_hal_flash_ex.o"
	$(CC) -c -o "../Drivers/STM32G0xx_HAL_Driver/Src/stm32g0xx_hal_gpio.c" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32G071xx -c -I../Core/Inc -I../Drivers/STM32G0xx_HAL_Driver/Inc -I../Drivers/STM32G0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32G0xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Drivers/STM32G0xx_HAL_Driver/Src/stm32g0xx_hal_gpio.d" -MT"Drivers/STM32G0xx_HAL_Driver/Src/stm32g0xx_hal_gpio.o" --specs=nano.specs -mfloat-abi=soft -mthumb -o "Drivers/STM32G0xx_HAL_Driver/Src/stm32g0xx_hal_gpio.o"
	$(CC) -c -o "../Drivers/STM32G0xx_HAL_Driver/Src/stm32g0xx_hal_pwr.c" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32G071xx -c -I../Core/Inc -I../Drivers/STM32G0xx_HAL_Driver/Inc -I../Drivers/STM32G0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32G0xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Drivers/STM32G0xx_HAL_Driver/Src/stm32g0xx_hal_pwr.d" -MT"Drivers/STM32G0xx_HAL_Driver/Src/stm32g0xx_hal_pwr.o" --specs=nano.specs -mfloat-abi=soft -mthumb -o "Drivers/STM32G0xx_HAL_Driver/Src/stm32g0xx_hal_pwr.o"
	$(CC) -c -o "../Drivers/STM32G0xx_HAL_Driver/Src/stm32g0xx_hal_pwr_ex.c" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32G071xx -c -I../Core/Inc -I../Drivers/STM32G0xx_HAL_Driver/Inc -I../Drivers/STM32G0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32G0xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Drivers/STM32G0xx_HAL_Driver/Src/stm32g0xx_hal_pwr_ex.d" -MT"Drivers/STM32G0xx_HAL_Driver/Src/stm32g0xx_hal_pwr_ex.o" --specs=nano.specs -mfloat-abi=soft -mthumb -o "Drivers/STM32G0xx_HAL_Driver/Src/stm32g0xx_hal_pwr_ex.o"
	$(CC) -c -o "../Drivers/STM32G0xx_HAL_Driver/Src/stm32g0xx_hal_rcc.c" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32G071xx -c -I../Core/Inc -I../Drivers/STM32G0xx_HAL_Driver/Inc -I../Drivers/STM32G0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32G0xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Drivers/STM32G0xx_HAL_Driver/Src/stm32g0xx_hal_rcc.d" -MT"Drivers/STM32G0xx_HAL_Driver/Src/stm32g0xx_hal_rcc.o" --specs=nano.specs -mfloat-abi=soft -mthumb -o "Drivers/STM32G0xx_HAL_Driver/Src/stm32g0xx_hal_rcc.o"
	$(CC) -c -o "../Drivers/STM32G0xx_HAL_Driver/Src/stm32g0xx_hal_rcc_ex.c" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32G071xx -c -I../Core/Inc -I../Drivers/STM32G0xx_HAL_Driver/Inc -I../Drivers/STM32G0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32G0xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Drivers/STM32G0xx_HAL_Driver/Src/stm32g0xx_hal_rcc_ex.d" -MT"Drivers/STM32G0xx_HAL_Driver/Src/stm32g0xx_hal_rcc_ex.o" --specs=nano.specs -mfloat-abi=soft -mthumb -o "Drivers/STM32G0xx_HAL_Driver/Src/stm32g0xx_hal_rcc_ex.o"
	$(CC) -c -o "../Drivers/STM32G0xx_HAL_Driver/Src/stm32g0xx_hal_tim.c" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32G071xx -c -I../Core/Inc -I../Drivers/STM32G0xx_HAL_Driver/Inc -I../Drivers/STM32G0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32G0xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Drivers/STM32G0xx_HAL_Driver/Src/stm32g0xx_hal_tim.d" -MT"Drivers/STM32G0xx_HAL_Driver/Src/stm32g0xx_hal_tim.o" --specs=nano.specs -mfloat-abi=soft -mthumb -o "Drivers/STM32G0xx_HAL_Driver/Src/stm32g0xx_hal_tim.o"
	$(CC) -c -o "../Drivers/STM32G0xx_HAL_Driver/Src/stm32g0xx_hal_tim_ex.c" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32G071xx -c -I../Core/Inc -I../Drivers/STM32G0xx_HAL_Driver/Inc -I../Drivers/STM32G0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32G0xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Drivers/STM32G0xx_HAL_Driver/Src/stm32g0xx_hal_tim_ex.d" -MT"Drivers/STM32G0xx_HAL_Driver/Src/stm32g0xx_hal_tim_ex.o" --specs=nano.specs -mfloat-abi=soft -mthumb -o "Drivers/STM32G0xx_HAL_Driver/Src/stm32g0xx_hal_tim_ex.o"
	$(CC) -c -o "../Drivers/STM32G0xx_HAL_Driver/Src/stm32g0xx_hal_uart.c" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32G071xx -c -I../Core/Inc -I../Drivers/STM32G0xx_HAL_Driver/Inc -I../Drivers/STM32G0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32G0xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Drivers/STM32G0xx_HAL_Driver/Src/stm32g0xx_hal_uart.d" -MT"Drivers/STM32G0xx_HAL_Driver/Src/stm32g0xx_hal_uart.o" --specs=nano.specs -mfloat-abi=soft -mthumb -o "Drivers/STM32G0xx_HAL_Driver/Src/stm32g0xx_hal_uart.o"
	$(CC) -c -o "../Drivers/STM32G0xx_HAL_Driver/Src/stm32g0xx_hal_uart_ex.c" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32G071xx -c -I../Core/Inc -I../Drivers/STM32G0xx_HAL_Driver/Inc -I../Drivers/STM32G0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32G0xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Drivers/STM32G0xx_HAL_Driver/Src/stm32g0xx_hal_uart_ex.d" -MT"Drivers/STM32G0xx_HAL_Driver/Src/stm32g0xx_hal_uart_ex.o" --specs=nano.specs -mfloat-abi=soft -mthumb -o "Drivers/STM32G0xx_HAL_Driver/Src/stm32g0xx_hal_uart_ex.o"
	$(CC) -c -o "../Drivers/STM32G0xx_HAL_Driver/Src/stm32g0xx_ll_dma.c" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32G071xx -c -I../Core/Inc -I../Drivers/STM32G0xx_HAL_Driver/Inc -I../Drivers/STM32G0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32G0xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Drivers/STM32G0xx_HAL_Driver/Src/stm32g0xx_ll_dma.d" -MT"Drivers/STM32G0xx_HAL_Driver/Src/stm32g0xx_ll_dma.o" --specs=nano.specs -mfloat-abi=soft -mthumb -o "Drivers/STM32G0xx_HAL_Driver/Src/stm32g0xx_ll_dma.o"
	$(CC) -c -o "../Drivers/STM32G0xx_HAL_Driver/Src/stm32g0xx_ll_rcc.c" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32G071xx -c -I../Core/Inc -I../Drivers/STM32G0xx_HAL_Driver/Inc -I../Drivers/STM32G0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32G0xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Drivers/STM32G0xx_HAL_Driver/Src/stm32g0xx_ll_rcc.d" -MT"Drivers/STM32G0xx_HAL_Driver/Src/stm32g0xx_ll_rcc.o" --specs=nano.specs -mfloat-abi=soft -mthumb -o "Drivers/STM32G0xx_HAL_Driver/Src/stm32g0xx_ll_rcc.o"
	$(CC) -c -o -mcpu=cortex-m0plus -g3 -DDEBUG -c -x assembler-with-cpp -MMD -MP -MF"Core/Startup/startup_stm32g071rbtx.d" -MT"Core/Startup/startup_stm32g071rbtx.o" --specs=nano.specs -mfloat-abi=soft -mthumb -o "Core/Startup/startup_stm32g071rbtx.o" "../Core/Startup/startup_stm32g071rbtx.s"
	$(CC) -c -o "../Core/Src/main.c" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32G071xx -c -I../Core/Inc -I../Drivers/STM32G0xx_HAL_Driver/Inc -I../Drivers/STM32G0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32G0xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Core/Src/main.d" -MT"Core/Src/main.o" --specs=nano.specs -mfloat-abi=soft -mthumb -o "Core/Src/main.o"
	$(CC) -c -o "../Core/Src/stm32g0xx_hal_msp.c" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32G071xx -c -I../Core/Inc -I../Drivers/STM32G0xx_HAL_Driver/Inc -I../Drivers/STM32G0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32G0xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Core/Src/stm32g0xx_hal_msp.d" -MT"Core/Src/stm32g0xx_hal_msp.o" --specs=nano.specs -mfloat-abi=soft -mthumb -o "Core/Src/stm32g0xx_hal_msp.o"
	$(CC) -c -o "../Core/Src/stm32g0xx_it.c" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32G071xx -c -I../Core/Inc -I../Drivers/STM32G0xx_HAL_Driver/Inc -I../Drivers/STM32G0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32G0xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Core/Src/stm32g0xx_it.d" -MT"Core/Src/stm32g0xx_it.o" --specs=nano.specs -mfloat-abi=soft -mthumb -o "Core/Src/stm32g0xx_it.o"
	$(CC) -c -o "../Core/Src/syscalls.c" -mcpu=-std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32G071xx -c -I../Core/Inc -I../Drivers/STM32G0xx_HAL_Driver/Inc -I../Drivers/STM32G0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32G0xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Core/Src/syscalls.d" -MT"Core/Src/syscalls.o" --specs=nano.specs -mfloat-abi=soft -mthumb -o "Core/Src/syscalls.o"
	$(CC) -c -o "../Core/Src/sysmem.c" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32G071xx -c -I../Core/Inc -I../Drivers/STM32G0xx_HAL_Driver/Inc -I../Drivers/STM32G0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32G0xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Core/Src/sysmem.d" -MT"Core/Src/sysmem.o" --specs=nano.specs -mfloat-abi=soft -mthumb -o "Core/Src/sysmem.o"
	$(CC) -c -o "../Core/Src/system_stm32g0xx.c" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32G071xx -c -I../Core/Inc -I../Drivers/STM32G0xx_HAL_Driver/Inc -I../Drivers/STM32G0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32G0xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Core/Src/system_stm32g0xx.d" -MT"Core/Src/system_stm32g0xx.o" --specs=nano.specs -mfloat-abi=soft -mthumb -o "Core/Src/system_stm32g0xx.o"
	$(CC) -c -o "$(BUILD_ARTIFACT_NAME).elf" @"objects.list"   -mcpu=cortex-m0plus -T"../STM32G071RBTX_FLASH.ld" --specs=nosys.specs -Wl,-Map="$(BUILD_ARTIFACT_NAME).map" -Wl,--gc-sections -static --specs=nano.specs -mfloat-abi=soft -mthumb -Wl,--start-group -lc -lm -Wl,--end-group

$(BUILD_ARTIFACT_NAME).elf $(BUILD_ARTIFACT_NAME).map: $(OBJS) $(USER_OBJS) ./STM32G071RBTX_FLASH.ld makefile objects.list $(OPTIONAL_TOOL_DEPS)
	$(CC) -c -o "$(BUILD_ARTIFACT_NAME).elf" @"objects.list" $(USER_OBJS) $(LIBS) -mcpu=cortex-m0plus -T"../STM32G071RBTX_FLASH.ld" --specs=nosys.specs -Wl,-Map="$(BUILD_ARTIFACT_NAME).map" -Wl,--gc-sections -static --specs=nano.specs -mfloat-abi=soft -mthumb -Wl,--start-group -lc -lm -Wl,--end-group
	@echo 'Finished building target: $@'
	@echo ' '

default.size.stdout: $(EXECUTABLES) makefile objects.list $(OPTIONAL_TOOL_DEPS)
	arm-none-eabi-size  $(EXECUTABLES)
	@echo 'Finished building: $@'
	@echo ' '

$(BUILD_ARTIFACT_NAME).list: $(EXECUTABLES) makefile objects.list $(OPTIONAL_TOOL_DEPS)
	arm-none-eabi-objdump -h -S $(EXECUTABLES) > "$(BUILD_ARTIFACT_NAME).list"
	@echo 'Finished building: $@'
	@echo ' '

$(BUILD_ARTIFACT_NAME).hex: $(EXECUTABLES) makefile objects.list $(OPTIONAL_TOOL_DEPS)
	arm-none-eabi-objcopy  -O ihex $(EXECUTABLES) "$(BUILD_ARTIFACT_NAME).hex"
	@echo 'Finished building: $@'
	@echo ' '

# Other Targets
clean:
	-$(RM) $(BUILD_ARTIFACT_NAME).elf $(BUILD_ARTIFACT_NAME).hex $(BUILD_ARTIFACT_NAME).list $(BUILD_ARTIFACT_NAME).map default.size.stdout
	-@echo ' '

secondary-outputs: $(SIZE_OUTPUT) $(OBJDUMP_LIST) $(OBJCOPY_HEX)

fail-specified-linker-script-missing:
	@echo 'Error: Cannot find the specified linker script. Check the linker settings in the build configuration.'
	@exit 2

warn-no-linker-script-specified:
	@echo 'Warning: No linker script specified. Check the linker settings in the build configuration.'

.PHONY: all clean dependents main-build fail-specified-linker-script-missing warn-no-linker-script-specified
