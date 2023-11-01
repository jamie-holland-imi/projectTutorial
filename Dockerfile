# Specify Opperating System and its version
FROM ubuntu:20.04

# Download Linux support tools
RUN apt-get update && \
         apt-get clean && \ 
         apt-get install -y \
             build-essential \
             python3 \
             git \
             make \
             cmake \
             wget \
             ninja-build \
             python3-pip \
             curl
# COPY . /home/dev

# Download,unpack,install the ARM Toolchain             
RUN wget -O arm-none-eabi.tar.xz "https://developer.arm.com/-/media/Files/downloads/gnu/12.3.rel1/binrel/arm-gnu-toolchain-12.3.rel1-x86_64-arm-none-eabi.tar.xz" --no-check-certificate && \
         mkdir arm-none-eabi && \ 
         tar xf arm-none-eabi.tar.xz -C arm-none-eabi --strip-components 1 && \ 
         rm arm-none-eabi.tar.xz
ENV PATH="/arm-none-eabi/bin:${PATH}"

# Download and install cppckeck
RUN git clone --depth 1 https://github.com/danmar/cppcheck.git && \
          cmake -S cppcheck -B cppcheck/build -G Ninja -DCMAKE_BUILD_TYPE=Release && \
          cmake --build cppcheck/build --target install && \
          rm -fr cppcheck

# Install Cpplint
RUN pip3 install cpplint -y

WORKDIR /home/dev
