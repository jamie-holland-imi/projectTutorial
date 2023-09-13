# Specify Opperating System and its version
FROM ubuntu:latest

# Download Linux support tools
RUN apt-get update && \
         apt-get clean && \ 
         apt-get install -y \
             build-essential \
             make \
             git \
             wget \
             curl 
Run apt-get install cppcheck --no-check-certificate
# Download the Toolchain             
RUN wget -O gcc-arm-none-eabi.tar.xz "https://developer.arm.com/-/media/Files/downloads/gnu/12.3.rel1/binrel/arm-gnu-toolchain-12.3.rel1-x86_64-arm-none-eabi.tar.xz" --no-check-certificate
# unpack the archive to a neatly named target directory
RUN mkdir gcc-arm-none-eabi 
RUN tar xf gcc-arm-none-eabi.tar.xz -C gcc-arm-none-eabi --strip-components 1
# remove the archive
RUN rm gcc-arm-none-eabi.tar.xz
# Add toolchain to enviroment path
ENV PATH="/gcc-arm-none-eabi/bin:${PATH}"
# Check if toolchain has been installed correctly
RUN arm-none-eabi-gcc --version

# Add all files in the repository
WORKDIR /home/dev
COPY . /home/dev
