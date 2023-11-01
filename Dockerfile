# Specify Opperating System and its version
FROM ubuntu:20.04
ENV TZ="Europe/London"

# Download Linux support tools
RUN apt-get update && \
         apt-get clean && \ 
         apt-get install -y \
             build-essential \
             python3 \
             python3-pip \           
             git \
             make \
             cmake \
             wget \
             curl

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
RUN apt-get install -y --no-install-recommends \
         tzdata \
         ninja-build
#cppcheck -y
RUN pip3 install cpplint -y

WORKDIR /home/dev
