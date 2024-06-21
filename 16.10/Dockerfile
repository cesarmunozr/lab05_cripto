# Usa la imagen de Ubuntu 16.10
FROM ubuntu:16.10

# Actualiza las fuentes de repositorios a old-releases
RUN echo 'deb http://old-releases.ubuntu.com/ubuntu yakkety main multiverse restricted universe' > /etc/apt/sources.list && \
    echo 'deb http://old-releases.ubuntu.com/ubuntu yakkety-backports main multiverse restricted universe' >> /etc/apt/sources.list && \
    echo 'deb http://old-releases.ubuntu.com/ubuntu yakkety-proposed main multiverse restricted universe' >> /etc/apt/sources.list && \
    echo 'deb http://old-releases.ubuntu.com/ubuntu yakkety-security main multiverse restricted universe' >> /etc/apt/sources.list && \
    echo 'deb http://old-releases.ubuntu.com/ubuntu yakkety-updates main multiverse restricted universe' >> /etc/apt/sources.list

# Actualiza la lista de paquetes e instala el cliente OpenSSH
RUN apt-get update && \
    apt-get install -y openssh-client && \
    apt-get clean

# Configuración de un directorio de trabajo
WORKDIR /data

# Establece el comando predeterminado para el contenedor
CMD ["/bin/bash"]