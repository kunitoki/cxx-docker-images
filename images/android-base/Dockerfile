FROM ubuntu:18.04
LABEL maintainer="Lucio Asnaghi <kunitoki@gmail.com>"

ARG CMAKE_VERSION=3.18.1

WORKDIR /opt

ENV ANDROID_SDK_ROOT /opt/android-sdk-linux
ENV ANDROID_HOME /opt/android-sdk-linux
ENV PATH "${PATH}:${ANDROID_SDK_ROOT}/platform-tools"
ENV PATH "${PATH}:${ANDROID_SDK_ROOT}/cmdline-tools/latest/bin"
ENV PATH "${PATH}:${ANDROID_SDK_ROOT}/cmake/${CMAKE_VERSION}/bin"

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
        openjdk-11-jdk \
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

RUN update-alternatives --set javac /usr/lib/jvm/java-11-openjdk-amd64/bin/javac
RUN update-alternatives --set java /usr/lib/jvm/java-11-openjdk-amd64/bin/java

RUN curl -SL https://dl.google.com/android/repository/commandlinetools-linux-6858069_latest.zip -o android-commandline-tools.zip \
    && mkdir -p ${ANDROID_SDK_ROOT}/cmdline-tools \
    && unzip -q android-commandline-tools.zip -d /tmp/ \
    && mv /tmp/cmdline-tools/ ${ANDROID_SDK_ROOT}/cmdline-tools/latest \
    && rm android-commandline-tools.zip && ls -la ${ANDROID_SDK_ROOT}/cmdline-tools/latest/

RUN yes | sdkmanager --licenses
RUN touch /root/.android/repositories.cfg
RUN yes | sdkmanager "tools", "platform-tools"
RUN yes | sdkmanager --update --channel=0

# Please keep all sections in descending order!
RUN yes | sdkmanager \
    "platforms;android-30" \
    "platforms;android-29" \
    "build-tools;30.0.3" \
    "build-tools;29.0.3" \
    "build-tools;28.0.3" \
    "extras;android;m2repository" \
    "extras;google;m2repository" \
    "extras;google;google_play_services" \
    "extras;m2repository;com;android;support;constraint;constraint-layout;1.0.2" \
    "extras;m2repository;com;android;support;constraint;constraint-layout;1.0.1" \
    "cmake;3.18.1" \
    "cmake;3.10.2.4988404"
