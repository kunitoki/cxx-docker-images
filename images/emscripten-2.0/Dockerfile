FROM emscripten/emsdk:2.0.34
LABEL maintainer="Lucio Asnaghi <kunitoki@gmail.com>"

ARG CMAKE_VERSION=3.28.0

RUN apt-get -qq update -y \
    && apt-get -qq install -y --no-install-recommends \
        software-properties-common \
        ca-certificates \
        build-essential \
        python3 \
        gnupg \
        ninja-build \
        ccache \
        bzip2 \
        xz-utils \
        libxml2 \
        libatomic1 \
        curl \
        git \
    && apt-get clean -y \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/*

RUN update-alternatives --install /usr/bin/python python /usr/bin/python3 10

RUN curl -SL https://github.com/Kitware/CMake/releases/download/v${CMAKE_VERSION}/cmake-${CMAKE_VERSION}-Linux-x86_64.sh -o /tmp/cmake-install.sh \
    && chmod u+x /tmp/cmake-install.sh \
    && mkdir /cmake \
    && /tmp/cmake-install.sh --skip-license --prefix=/cmake \
    && rm /tmp/cmake-install.sh

ENV PATH="/cmake/bin:${PATH}"
