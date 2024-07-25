FROM ubuntu:20.04
LABEL maintainer="Lucio Asnaghi <kunitoki@gmail.com>"

ARG CMAKE_VERSION=3.29.2

WORKDIR /opt

ENV PATH "${PATH}:/usr/bin/cmake/bin"

RUN apt-get -qq update -y \
    && DEBIAN_FRONTEND=noninteractive apt-get -qq install -y --no-install-recommends \
        ca-certificates \
        software-properties-common \
        build-essential \
        python3 \
        python3-pip \
        virtualenv \
        ninja-build \
        zip \
        unzip \
        curl \
        ccache \
        xz-utils \
        git \
    && apt-get clean -y \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/*

RUN add-apt-repository ppa:openjdk-r/ppa \
    && apt-get -qq update -y \
    && DEBIAN_FRONTEND=noninteractive apt-get -qq install -y --no-install-recommends \
        openjdk-17-jdk \
        libc6 \
        libgcc1 \
        libglu1 \
        libncurses5 \
        libstdc++6 \
        libz1 \
        net-tools \
    && apt-get clean -y \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/*

RUN mv /etc/ssl/certs/java/cacerts /etc/ssl/certs/java/cacerts.old \
    && keytool -importkeystore \
        -destkeystore /etc/ssl/certs/java/cacerts \
        -deststoretype jks \
        -deststorepass changeit \
        -srckeystore /etc/ssl/certs/java/cacerts.old \
        -srcstoretype pkcs12 \
        -srcstorepass changeit \
    && rm /etc/ssl/certs/java/cacerts.old

RUN update-alternatives --set javac /usr/lib/jvm/java-17-openjdk-amd64/bin/javac
RUN update-alternatives --set java /usr/lib/jvm/java-17-openjdk-amd64/bin/java

RUN curl -SL https://github.com/Kitware/CMake/releases/download/v${CMAKE_VERSION}/cmake-${CMAKE_VERSION}-Linux-x86_64.sh -o /tmp/curl-install.sh \
    && chmod u+x /tmp/curl-install.sh \
    && mkdir /usr/bin/cmake \
    && /tmp/curl-install.sh --skip-license --prefix=/usr/bin/cmake \
    && rm /tmp/curl-install.sh
