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
    && rm -rf /var/lib/apt/lists/* \
    && curl https://cmake.org/files/v3.13/cmake-3.13.2-Linux-x86_64.sh -o /tmp/curl-install.sh \
    && chmod u+x /tmp/curl-install.sh \
    && mkdir /usr/bin/cmake \
    && /tmp/curl-install.sh --skip-license --prefix=/usr/bin/cmake \
    && rm /tmp/curl-install.sh

RUN curl -SL http://releases.llvm.org/3.9.0/clang+llvm-3.9.0-x86_64-linux-gnu-ubuntu-16.04.tar.xz | tar -xJC . \
    && mv clang+llvm-3.9.0-x86_64-linux-gnu-ubuntu-16.04 clang_3.9.0

ENV PATH="/clang_3.9.0/bin:/usr/bin/cmake/bin:${PATH}"
ENV LD_LIBRARY_PATH="/clang_3.9.0/lib:${LD_LIBRARY_PATH}"
ENV CC="/clang_3.9.0/bin/clang"
ENV CXX="/clang_3.9.0/bin/clang++"
