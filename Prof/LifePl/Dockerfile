# Usa una imagen base de Linux, por ejemplo Ubuntu 20.04
FROM ubuntu:22.04

# Instala dependencias
RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    git \
    ninja-build \
    libgmp-dev \
    libssl-dev \
    pkg-config \
    --no-install-recommends

# Clona y compila la versión 7.6.4 de SWI-Prolog
RUN git clone https://github.com/SWI-Prolog/swipl-devel.git /swipl-src && \
    cd /swipl-src && \
    git checkout V7.6.4 && \
    mkdir build && \
    cd build && \
    cmake -G Ninja .. && \
    ninja && \
    ninja install && \
    ldconfig

# El comando por defecto será ejecutar swipl
CMD ["swipl"]