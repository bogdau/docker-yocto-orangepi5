# Use a lightweight base image with development tools
FROM ubuntu:22.04

# Set environment variables for Yocto
ENV DEBIAN_FRONTEND=noninteractive \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US:en \
    LC_ALL=en_US.UTF-8

# Install necessary packages for Yocto and system tools
RUN apt-get update && apt-get install -y \
    gawk wget git-core diffstat unzip texinfo gcc-multilib \
    build-essential chrpath socat cpio python3 python3-pip python3-pexpect \
    xz-utils debianutils iputils-ping libsdl1.2-dev xterm curl file lz4 zstd\
    nano vim \
    locales && \
    locale-gen en_US.UTF-8 && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Create a non-root user
ARG USERNAME=yocto
ARG USER_UID=1000
ARG USER_GID=1000
RUN groupadd --gid $USER_GID $USERNAME && \
    useradd --uid $USER_UID --gid $USER_GID --create-home --shell /bin/bash $USERNAME && \
    echo "$USERNAME ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Switch to non-root user
USER $USERNAME
WORKDIR /home/$USERNAME

# Clone the Poky repository for Yocto (scarthgap branch)
RUN git clone -b kirkstone git://git.yoctoproject.org/poky

# Clone the meta-openembedded layer (scarthgap branch)
RUN git clone -b kirkstone git://git.openembedded.org/meta-openembedded

# Clone the meta-rockchip layer (kirkstone branch)
RUN git clone -b kirkstone https://github.com/JeffyCN/meta-rockchip.git

# Set up the Yocto environment
WORKDIR /home/yocto
# RUN . oe-init-build-env


# Entrypoint for Yocto build environment
CMD ["/bin/bash"]
