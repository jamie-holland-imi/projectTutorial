# Specify Opperating System and its version
FROM ubuntu:20.04

# Download Linux support tools
RUN apt-get update && \
         apt-get clean && \ 
         apt-get install -y \
             build-essential \
             make \
             git \
             wget \
             python3 \
             curl
             
# Add all files in the repository
# COPY . /home/dev

# Download,unpack,install the ARM Toolchain             
RUN wget -O gcc-arm-none-eabi.tar.xz "https://developer.arm.com/-/media/Files/downloads/gnu/12.3.rel1/binrel/arm-gnu-toolchain-12.3.rel1-x86_64-arm-none-eabi.tar.xz" --no-check-certificate && \
         mkdir gcc-arm-none-eabi && \ 
         tar xf gcc-arm-none-eabi.tar.xz -C gcc-arm-none-eabi --strip-components 1 && \ 
         rm gcc-arm-none-eabi.tar.xz
# Add toolchain to enviroment path
ENV PATH="/gcc-arm-none-eabi/bin:${PATH}"
# Check if toolchain has been installed correctly
RUN arm-none-eabi-gcc --version

# Add all files in the repository
WORKDIR /home/dev
