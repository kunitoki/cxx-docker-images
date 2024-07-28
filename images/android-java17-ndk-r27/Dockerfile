FROM kunitoki/android-java17-base:latest
LABEL maintainer="Lucio Asnaghi <kunitoki@gmail.com>"

ARG NDK_VERSION=27.0.12077973
ARG NDK_COMMANDLINE_TOOL_VERSION=11076708

WORKDIR /opt

ENV ANDROID_SDK_ROOT /opt/android-sdk-linux
ENV ANDROID_HOME /opt/android-sdk-linux
ENV ANDROID_NDK /opt/android-sdk-linux/ndk/${NDK_VERSION}
ENV ANDROID_NDK_HOME /opt/android-sdk-linux/ndk/${NDK_VERSION}
ENV PATH "${PATH}:${ANDROID_SDK_ROOT}/platform-tools"
ENV PATH "${PATH}:${ANDROID_SDK_ROOT}/cmdline-tools/latest/bin"

RUN curl -SL https://dl.google.com/android/repository/commandlinetools-linux-${NDK_COMMANDLINE_TOOL_VERSION}_latest.zip -o android-commandline-tools.zip \
    && mkdir -p ${ANDROID_SDK_ROOT}/cmdline-tools \
    && unzip -q android-commandline-tools.zip -d /tmp/ \
    && mv /tmp/cmdline-tools/ ${ANDROID_SDK_ROOT}/cmdline-tools/latest \
    && rm android-commandline-tools.zip && ls -la ${ANDROID_SDK_ROOT}/cmdline-tools/latest/

RUN yes | sdkmanager --licenses
RUN touch /root/.android/repositories.cfg
RUN yes | sdkmanager "platform-tools"
RUN yes | sdkmanager --update --channel=0
RUN yes | sdkmanager \
    "platforms;android-34" \
    "build-tools;33.0.3" \
    "extras;android;m2repository" \
    "extras;google;m2repository" \
    "extras;google;google_play_services" \
    "extras;m2repository;com;android;support;constraint;constraint-layout;1.0.2" \
    "extras;m2repository;com;android;support;constraint;constraint-layout;1.0.1" \
    "ndk;${NDK_VERSION}"
