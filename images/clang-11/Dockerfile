FROM ubuntu:16.04
MAINTAINER Lucio Asnaghi <kunitoki@gmail.com>

ARG CMAKE_VERSION=3.18.3

RUN apt-get -qq update -y \
    && apt-get -qq install -y --no-install-recommends \
        ca-certificates \
        software-properties-common \
        build-essential \
        python \
        ninja-build \
        ccache \
        xz-utils \
        curl \
        git \
    && apt-get clean -y \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/*

RUN add-apt-repository ppa:jonathonf/gcc-8.0 \
    && apt-get -qq update -y \
    && apt-get -qq install -y --no-install-recommends \
        gcc-8 \
    && apt-get clean -y \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/*

RUN curl -SL https://github.com/Kitware/CMake/releases/download/v${CMAKE_VERSION}/cmake-${CMAKE_VERSION}-Linux-x86_64.sh -o /tmp/curl-install.sh \
    && chmod u+x /tmp/curl-install.sh \
    && mkdir /usr/bin/cmake \
    && /tmp/curl-install.sh --skip-license --prefix=/usr/bin/cmake \
    && rm /tmp/curl-install.sh

RUN curl -SL https://github.com/llvm/llvm-project/releases/download/llvmorg-11.1.0/clang+llvm-11.1.0-x86_64-linux-gnu-ubuntu-16.04.tar.xz | tar -xJC . \
    && mv clang+llvm-11.1.0-x86_64-linux-gnu-ubuntu-16.04 clang_11.1.0

ENV PATH="/clang_11.1.0/bin:/usr/bin/cmake/bin:${PATH}"
ENV LD_LIBRARY_PATH="/clang_11.1.0/lib:${LD_LIBRARY_PATH}"
ENV CC="/clang_11.1.0/bin/clang"
ENV CXX="/clang_11.1.0/bin/clang++"
