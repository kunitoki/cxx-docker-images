FROM ubuntu:18.04
LABEL maintainer="Lucio Asnaghi <kunitoki@gmail.com>"

ARG CMAKE_VERSION=3.23.2

RUN apt-get -qq update -y \
    && apt-get -qq install -y --no-install-recommends \
        ca-certificates \
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

RUN curl -SL https://github.com/Kitware/CMake/releases/download/v${CMAKE_VERSION}/cmake-${CMAKE_VERSION}-Linux-x86_64.sh -o /tmp/curl-install.sh \
    && chmod u+x /tmp/curl-install.sh \
    && mkdir /usr/bin/cmake \
    && /tmp/curl-install.sh --skip-license --prefix=/usr/bin/cmake \
    && rm /tmp/curl-install.sh

RUN curl -SL http://releases.llvm.org/7.0.1/clang+llvm-7.0.1-x86_64-linux-gnu-ubuntu-18.04.tar.xz | tar -xJC . \
    && mv clang+llvm-7.0.1-x86_64-linux-gnu-ubuntu-18.04 clang_7.0.1

ENV PATH="/clang_7.0.1/bin:/usr/bin/cmake/bin:${PATH}"
ENV LD_LIBRARY_PATH="/clang_7.0.1/lib:${LD_LIBRARY_PATH}"
ENV CC="/clang_7.0.1/bin/clang"
ENV CXX="/clang_7.0.1/bin/clang++"
