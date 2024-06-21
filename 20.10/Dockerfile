# Usa la imagen de Ubuntu 20.10
FROM ubuntu:20.10

# Actualiza las fuentes de repositorios a old-releases
RUN echo 'deb http://old-releases.ubuntu.com/ubuntu groovy main multiverse restricted universe' > /etc/apt/sources.list && \
    echo 'deb http://old-releases.ubuntu.com/ubuntu groovy-backports main multiverse restricted universe' >> /etc/apt/sources.list && \
    echo 'deb http://old-releases.ubuntu.com/ubuntu groovy-proposed main multiverse restricted universe' >> /etc/apt/sources.list && \
    echo 'deb http://old-releases.ubuntu.com/ubuntu groovy-security main multiverse restricted universe' >> /etc/apt/sources.list && \
    echo 'deb http://old-releases.ubuntu.com/ubuntu groovy-updates main multiverse restricted universe' >> /etc/apt/sources.list

# Actualiza la lista de paquetes e instala el cliente OpenSSH
RUN apt-get update && \
    apt-get install -y openssh-client && \
    apt-get clean

# Configuración de un directorio de trabajo
WORKDIR /data

# Establece el comando predeterminado para el contenedor
CMD ["/bin/bash"]
