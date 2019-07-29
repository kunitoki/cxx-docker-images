FROM ubuntu:19.04
MAINTAINER Lucio Asnaghi <kunitoki@gmail.com>

ARG GCC_VERSION=9
ARG LIB_ASAN_VERSION=5
ARG LIB_UBSAN_VERSION=1
ARG LIB_TSAN_VERSION=0

RUN apt-get -qq update \
    && apt-get -qq install -y --no-install-recommends \
        software-properties-common \
        ca-certificates \
        python \
        build-essential \
        ninja-build \
        curl \
        ccache \
        git \
    && apt-get -qq install -y \
        g++-${GCC_VERSION} \
        gcc-${GCC_VERSION} \
        libasan${LIB_ASAN_VERSION} \
        libubsan${LIB_UBSAN_VERSION} \
        libtsan${LIB_TSAN_VERSION} \
    && update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-${GCC_VERSION} 60 \
        --slave /usr/bin/g++ g++ /usr/bin/g++-${GCC_VERSION} \
    && apt-get clean \
    && apt-get autoremove \
    && rm -rf /var/lib/apt/lists/*

RUN curl https://github.com/Kitware/CMake/releases/download/v3.14.6/cmake-3.14.6-Linux-x86_64.sh -o /tmp/curl-install.sh \
    && chmod u+x /tmp/curl-install.sh \
    && mkdir /usr/bin/cmake \
    && /tmp/curl-install.sh --skip-license --prefix=/usr/bin/cmake \
    && rm /tmp/curl-install.sh

ENV PATH="/usr/bin/cmake/bin:${PATH}"
