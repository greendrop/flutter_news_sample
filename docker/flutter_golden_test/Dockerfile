FROM ubuntu:24.04

ARG FLUTTER_VERSION=3.29.2

ENV FLUTTER_VERSION=$FLUTTER_VERSION

RUN apt-get update && apt-get install -y \
    curl \
    git \
    unzip \
    xz-utils \
    zip \
    libglu1-mesa \
    && rm -rf /var/lib/apt/lists/*

RUN curl -o flutter.tar.xz https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_$FLUTTER_VERSION-stable.tar.xz \
    && mkdir -p /usr/local/flutter \
    && tar -xf flutter.tar.xz -C /usr/local/flutter --strip-components=1 \
    && git config --global --add safe.directory /usr/local/flutter \
    && rm flutter.tar.xz

ENV PATH="/usr/local/flutter/bin:$PATH"

RUN flutter doctor --android-licenses || true && flutter doctor || true

CMD ["flutter", "--version"]
