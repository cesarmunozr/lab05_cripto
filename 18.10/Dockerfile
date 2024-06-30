# Usa la imagen de Ubuntu 18.10
FROM ubuntu:18.10

# Actualiza las fuentes de repositorios a old-releases
RUN echo 'deb http://old-releases.ubuntu.com/ubuntu cosmic main multiverse restricted universe' > /etc/apt/sources.list && \
    echo 'deb http://old-releases.ubuntu.com/ubuntu cosmic-backports main multiverse restricted universe' >> /etc/apt/sources.list && \
    echo 'deb http://old-releases.ubuntu.com/ubuntu cosmic-proposed main multiverse restricted universe' >> /etc/apt/sources.list && \
    echo 'deb http://old-releases.ubuntu.com/ubuntu cosmic-security main multiverse restricted universe' >> /etc/apt/sources.list && \
    echo 'deb http://old-releases.ubuntu.com/ubuntu cosmic-updates main multiverse restricted universe' >> /etc/apt/sources.list

# Actualiza la lista de paquetes e instala el cliente OpenSSH y tcpdump
RUN apt-get update && \
    apt-get install -y openssh-client tcpdump && \
    apt-get clean

# Configuración de un directorio de trabajo
WORKDIR /data

# Establece el comando predeterminado para el contenedor
CMD ["/bin/bash"]
