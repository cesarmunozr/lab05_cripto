# Usa la imagen de Ubuntu 22.10
FROM ubuntu:22.10

# Actualiza las fuentes de repositorios a old-releases
RUN echo 'deb http://old-releases.ubuntu.com/ubuntu kinetic main multiverse restricted universe' > /etc/apt/sources.list && \
    echo 'deb http://old-releases.ubuntu.com/ubuntu kinetic-backports main multiverse restricted universe' >> /etc/apt/sources.list && \
    echo 'deb http://old-releases.ubuntu.com/ubuntu kinetic-proposed main multiverse restricted universe' >> /etc/apt/sources.list && \
    echo 'deb http://old-releases.ubuntu.com/ubuntu kinetic-security main multiverse restricted universe' >> /etc/apt/sources.list && \
    echo 'deb http://old-releases.ubuntu.com/ubuntu kinetic-updates main multiverse restricted universe' >> /etc/apt/sources.list

# Actualiza la lista de paquetes e instala el cliente y servidor OpenSSH
RUN apt-get update && \
    apt-get install -y openssh-client openssh-server && \
    apt-get clean

# Configuración del servidor SSH
RUN [ ! -d /var/run/sshd ] && mkdir /var/run/sshd || echo "Directory already exists" && \
    echo 'root:root' | chpasswd && \
    useradd -m prueba && \
    echo 'prueba:prueba' | chpasswd && \
    sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config

# Expone el puerto 22 para el servidor SSH
EXPOSE 22

# Configuración de un directorio de trabajo
WORKDIR /data

# Establece el comando predeterminado para el contenedor
CMD ["/usr/sbin/sshd", "-D"]