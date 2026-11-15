# syntax=docker/dockerfile:1

# Development and runtime image for OpenMoHAA.
#
# It contains everything needed to configure/compile the project and to run
# the resulting client inside distrobox (with GPU acceleration through Mesa or
# the host's NVIDIA drivers injected by `distrobox create --nvidia`).
#
# Build the image:
#   tools/do
#
# Create/enter the distrobox container:
#   tools/dtb
#
# Compile and install into /mohaa/build/install (data/ is left untouched):
#   tools/dtb /mohaa/tools/compile.sh
#
# Launch the game:
#   tools/dtb /mohaa/tools/run.sh

FROM debian:trixie-slim

LABEL org.opencontainers.image.title="OpenMoHAA dev/runtime" \
      org.opencontainers.image.description="Build and runtime dependencies for OpenMoHAA" \
      org.opencontainers.image.source="https://github.com/openmoh/openmohaa"

ENV LANG=C.UTF-8 \
    LC_ALL=C.UTF-8 \
    # tools/do runs the container with the host UID/GID and no writable /root
    HOME=/tmp \
    CC=clang \
    CXX=clang++

# ---------------------------------------------------------------------------
# Build dependencies
# ---------------------------------------------------------------------------
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        bash ca-certificates \
        cmake ninja-build make git pkg-config \
        clang lld \
        flex bison \
        libsdl2-dev \
        libopenal-dev \
        libcurl4-openssl-dev \
        zlib1g-dev \
    # -----------------------------------------------------------------------
    # Runtime dependencies (client + dedicated server)
    # -----------------------------------------------------------------------
        libsdl2-2.0-0 \
        libopenal1 \
        libcurl4t64 \
        zlib1g \
        libogg0 \
        libvorbis0a \
        libvorbisfile3 \
        libopus0 \
        libmad0 \
        libasound2t64 \
        libpulse0 \
    # OpenGL (Mesa software fallback and glvnd used by distrobox --nvidia)
        libgl1 \
        libglx0 \
        libglx-mesa0 \
        libgl1-mesa-dri \
        libglu1-mesa \
        libegl1 \
        libgles2 \
        mesa-utils \
        mesa-utils-bin \
    # X11 / Wayland libraries used by SDL2
        libx11-6 \
        libxext6 \
        libxrandr2 \
        libxi6 \
        libxcursor1 \
        libxinerama1 \
        libxss1 \
        libxxf86vm1 \
        libxrender1 \
        libxfixes3 \
        libxkbcommon0 \
        libwayland-client0 \
        libwayland-cursor0 \
        libwayland-egl1 \
    # distrobox requirements and useful shell tools
        sudo passwd util-linux \
        procps iproute2 hostname findutils \
        curl wget xz-utils less nano vim-tiny \
    && rm -rf /var/lib/apt/lists/*

# The project is bind-mounted here by tools/do and tools/dtb.
VOLUME /mohaa
WORKDIR /mohaa
