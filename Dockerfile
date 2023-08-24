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

# Add all files in the repository
WORKDIR /home/dev
COPY . /home/dev

# Download and Install ARM Toolchain             
RUN wget -O archive.tar.xz "https://developer.arm.com/-/media/Files/downloads/gnu/12.3.rel1/binrel/arm-gnu-toolchain-12.3.rel1-x86_64-arm-none-eabi.tar.xz" --no-check-certificate
RUN mkdir arm-gnu-toolchain
RUN tar xf archive.tar.xz -C arm-gnu-toolchain --strip-components 1

ENV PATH="$PATH:/home/dev/arm-gnu-toolchain/bin"

WORKDIR /home/dev/Build
#RUN make all
CMD ["sh", "-c", "make all"]
