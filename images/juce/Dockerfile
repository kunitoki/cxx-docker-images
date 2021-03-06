FROM ubuntu:18.04
MAINTAINER Lucio Asnaghi <kunitoki@gmail.com>

ARG CMAKE_VERSION=3.18.3

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
        zlib1g-dev \
        libpng-dev \
        libcurl3-dev \
        libcurl4-openssl-dev \
        libssl-dev \
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
        freeglut3-dev \
        mesa-common-dev \
        libglu1-mesa-dev \
        libwebkit2gtk-4.0-dev \
        libgtk-3-dev \
        libjack-jackd2-dev \
        ladspa-sdk \
    && apt-get clean -y \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/*

RUN curl -SL https://github.com/Kitware/CMake/releases/download/v${CMAKE_VERSION}/cmake-${CMAKE_VERSION}-Linux-x86_64.sh -o /tmp/curl-install.sh \
    && chmod u+x /tmp/curl-install.sh \
    && mkdir -p /cmake \
    && /tmp/curl-install.sh --skip-license --prefix=/cmake \
    && rm /tmp/curl-install.sh

ENV PATH="/cmake/bin:${PATH}"
