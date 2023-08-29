FROM ubuntu:latest

# Download Linux support tools
RUN apt-get update && \
         apt-get clean && \ 
         apt-get install -y \
             build-essential \
             make \
             git \
             wget \
             gcc-multilib \
             curl 
RUN apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Download the Toolchain             
RUN wget -O gcc-arm-none-eabi.tar.xz "https://developer.arm.com/-/media/Files/downloads/gnu/12.3.rel1/binrel/arm-gnu-toolchain-12.3.rel1-x86_64-arm-none-eabi.tar.xz" --no-check-certificate
# unpack the archive to a neatly named target directory
RUN mkdir gcc-arm-none-eabi 
RUN tar xf gcc-arm-none-eabi.tar.xz -C gcc-arm-none-eabi --strip-components 1
# remove the archive
RUN rm gcc-arm-none-eabi.tar.xz

ENV PATH="/gcc-arm-none-eabi/bin:${PATH}"

# Add all files in the repository
WORKDIR /home/dev
COPY . /home/dev
# WORKDIR /home/dev/Build

#RUN make all
#CMD ["sh", "-c", "make"]
