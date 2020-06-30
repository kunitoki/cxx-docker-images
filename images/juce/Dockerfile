FROM ubuntu:18.04
MAINTAINER Lucio Asnaghi <kunitoki@gmail.com>

RUN apt-get -qq update -y \
    && apt-get -qq install -y --no-install-recommends \
        ca-certificates \
        build-essential \
        python \
        curl \
        git \
        automake \
        make \
        xz-utils \
        zip \
        unzip \
        upx-ucl \
        pkg-config \
        libcurl3-dev \
        libcurl4-openssl-dev \
        libasound2-dev \
        libfreetype6-dev \
        libxcomposite-dev \
        libxcursor-dev \
        libxinerama-dev \
        libxrandr-dev \
        libxrender-dev \
        libx11-dev \
        x11proto-randr-dev \
        x11proto-render-dev \
        x11proto-xinerama-dev \
        libpng-dev \
        zlib1g-dev \
        freeglut3-dev \
        mesa-common-dev \
    && apt-get clean -y \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/*

RUN curl -SL http://releases.llvm.org/9.0.0/clang+llvm-9.0.0-x86_64-linux-gnu-ubuntu-18.04.tar.xz | tar -xJC . \
    && mv clang+llvm-9.0.0-x86_64-linux-gnu-ubuntu-18.04 clang_9.0.0

ENV PATH="/clang_9.0.0/bin:${PATH}"
ENV LD_LIBRARY_PATH="/clang_9.0.0/lib:${LD_LIBRARY_PATH}"
ENV CC="/clang_9.0.0/bin/clang"
ENV CXX="/clang_9.0.0/bin/clang++"
