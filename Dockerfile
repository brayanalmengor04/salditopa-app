FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# ─── Versiones fijadas para builds reproducibles ────────────────────────────
ARG FLUTTER_VERSION=3.32.0
ARG ANDROID_SDK_VERSION=11076708          
ARG ANDROID_BUILD_TOOLS_VERSION=34.0.0
ARG ANDROID_PLATFORM=android-34

ENV FLUTTER_VERSION=${FLUTTER_VERSION}
ENV ANDROID_SDK_ROOT=/opt/android-sdk
ENV PATH="${ANDROID_SDK_ROOT}/cmdline-tools/latest/bin:${ANDROID_SDK_ROOT}/platform-tools:${PATH}"

# ─── Dependencias del sistema ────────────────────────────────────────────────
# openjdk-17-jdk: requerido por el toolchain de Android (Gradle, aapt2, etc.)
# libglu1-mesa:   requerido por el renderer de Flutter
# inotify-tools:  para el hot-restart en el contenedor dev
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    git \
    unzip \
    xz-utils \
    zip \
    libglu1-mesa \
    inotify-tools \
    openjdk-17-jdk \
    wget \
    && rm -rf /var/lib/apt/lists/*

# JAVA_HOME es necesario para que Gradle lo detecte correctamente
ENV JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64

# ─── Android SDK (command-line tools) ───────────────────────────────────────
# Se descarga solo el paquete de command-line tools; sdkmanager instala el resto.
RUN mkdir -p ${ANDROID_SDK_ROOT}/cmdline-tools \
    && wget -q "https://dl.google.com/android/repository/commandlinetools-linux-${ANDROID_SDK_VERSION}_latest.zip" \
       -O /tmp/cmdline-tools.zip \
    && unzip -q /tmp/cmdline-tools.zip -d /tmp/cmdline-tools \
    # Google empaqueta el zip con la carpeta "cmdline-tools" adentro;
    # la mueve a la ruta que espera sdkmanager: cmdline-tools/latest/
    && mv /tmp/cmdline-tools/cmdline-tools ${ANDROID_SDK_ROOT}/cmdline-tools/latest \
    && rm -rf /tmp/cmdline-tools /tmp/cmdline-tools.zip

# ─── Aceptar licencias e instalar plataforma + build-tools ──────────────────
# Se acepta todo en un solo RUN para mantener el layer compacto.
# "yes" hace pipe automático a cada prompt de licencia del sdkmanager.
RUN yes | sdkmanager --licenses > /dev/null \
    && sdkmanager \
       "platform-tools" \
       "platforms;${ANDROID_PLATFORM}" \
       "build-tools;${ANDROID_BUILD_TOOLS_VERSION}"

# ─── Flutter ────────────────────────────────────────────────────────────────
WORKDIR /opt
RUN git clone https://github.com/flutter/flutter.git \
    --branch ${FLUTTER_VERSION} \
    --depth 1

ENV PATH="/opt/flutter/bin:/opt/flutter/bin/cache/dart-sdk/bin:${PATH}"

# ─── Configuración global de git y Flutter ──────────────────────────────────
# safe.directory: evita errores de permisos en bind-mounts de Windows.
# no-analytics:   evita peticiones de red en cada comando.
RUN git config --global --add safe.directory '*' \
    && flutter config --no-analytics \
    && dart --disable-analytics \
    # Apuntar Flutter al Android SDK instalado
    && flutter config --android-sdk ${ANDROID_SDK_ROOT}

# ─── Pre-descarga de artefactos (web + android) ─────────────────────────────
# Layer pesado pero cacheado: solo se re-ejecuta si cambia FLUTTER_VERSION.
RUN flutter precache --web --android

# ─── Copiar pubspec ANTES que el resto del código ───────────────────────────
# Patrón cache-friendly: el layer de "pub get" solo se invalida si cambian
# las dependencias, no en cada cambio de código fuente.
WORKDIR /app/app
COPY app/pubspec.yaml app/pubspec.lock ./
RUN flutter pub get

# ─── Copiar el resto del proyecto ───────────────────────────────────────────
WORKDIR /app
COPY . .

# Verificación rápida: flutter pub get con el código ya copiado
# (casi instantáneo porque el caché del paso anterior sigue válido)
WORKDIR /app/app
RUN flutter pub get