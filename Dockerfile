# Use the minimal Ubuntu image
FROM ubuntu:22.04

# Install OpenSSH server
RUN apt-get update && \
    apt-get install -y openssh-server libssl-dev autoconf gcc make supervisor && \
    rm -rf /var/lib/apt/lists/*

# Create an SSH user with a password
RUN useradd --create-home --shell /bin/bash -g root -G sudo -u 1000 user && \
    echo 'user:password' | chpasswd

# Allow SSH access and expose port 22
RUN mkdir -p /var/run/sshd /var/log/supervisor
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
EXPOSE 22

# Buildding the app
WORKDIR /qssh
COPY . /qssh

RUN ./build.sh
RUN make install

# Clean up build dir
WORKDIR /usr/qssh
RUN rm -rf /qssh

# port for qssh
EXPOSE 1305

# Start the SSH server
#CMD ["/usr/sbin/sshd", "-D"]
CMD ["/usr/bin/supervisord"]