# Usa la imagen de Ubuntu 22.10
FROM ubuntu:22.10

# Configuración de un directorio de trabajo
WORKDIR /data

# Actualiza las fuentes de repositorios a old-releases
RUN echo 'deb http://old-releases.ubuntu.com/ubuntu kinetic main multiverse restricted universe' > /etc/apt/sources.list && \
    echo 'deb http://old-releases.ubuntu.com/ubuntu kinetic-backports main multiverse restricted universe' >> /etc/apt/sources.list && \
    echo 'deb http://old-releases.ubuntu.com/ubuntu kinetic-proposed main multiverse restricted universe' >> /etc/apt/sources.list && \
    echo 'deb http://old-releases.ubuntu.com/ubuntu kinetic-security main multiverse restricted universe' >> /etc/apt/sources.list && \
    echo 'deb http://old-releases.ubuntu.com/ubuntu kinetic-updates main multiverse restricted universe' >> /etc/apt/sources.list

# Actualiza la lista de paquetes e instala el cliente y servidor OpenSSH y tcpdump
RUN apt-get update && \
    apt-get install -y openssh-client openssh-server tcpdump vim autoconf libssl-dev zlib1g-dev gcc make git && \
    apt-get clean

# Configuración del servidor SSH
RUN echo 'root:root' | chpasswd && \
    useradd -m prueba && \
    echo 'prueba:prueba' | chpasswd && \
    sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config

# Expone el puerto 22 para el servidor SSH
EXPOSE 22

COPY sshd_config /data/sshd_config
COPY version.h /data/version.h
COPY config.sh /data/config.sh

RUN chmod +x /data/config.sh

# Establece el comando predeterminado para el contenedor
CMD ["/usr/sbin/sshd", "-D"]