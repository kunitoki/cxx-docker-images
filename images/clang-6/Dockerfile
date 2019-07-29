FROM ubuntu:16.04
MAINTAINER Lucio Asnaghi <kunitoki@gmail.com>

RUN apt-get -qq update \
    && apt-get -qq install -y --no-install-recommends \
        ca-certificates \
        build-essential \
        python \
        ninja-build \
        ccache \
        xz-utils \
        curl \
        git \
    && apt-get clean \
    && apt-get autoremove \
    && rm -rf /var/lib/apt/lists/*

RUN curl https://github.com/Kitware/CMake/releases/download/v3.14.6/cmake-3.14.6-Linux-x86_64.sh -o /tmp/curl-install.sh \
    && chmod u+x /tmp/curl-install.sh \
    && mkdir /usr/bin/cmake \
    && /tmp/curl-install.sh --skip-license --prefix=/usr/bin/cmake \
    && rm /tmp/curl-install.sh

RUN curl -SL http://releases.llvm.org/6.0.1/clang+llvm-6.0.1-x86_64-linux-gnu-ubuntu-16.04.tar.xz | tar -xJC . \
    && mv clang+llvm-6.0.1-x86_64-linux-gnu-ubuntu-16.04 clang_6.0.1

ENV PATH="/clang_6.0.1/bin:/usr/bin/cmake/bin:${PATH}"
ENV LD_LIBRARY_PATH="/clang_6.0.1/lib:${LD_LIBRARY_PATH}"
ENV CC="/clang_6.0.1/bin/clang"
ENV CXX="/clang_6.0.1/bin/clang++"
