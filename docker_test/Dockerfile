# Use the minimal Ubuntu image
FROM ubuntu:22.04

# Install OpenSSH server
RUN apt-get update && \
    apt-get install -y openssh-server

# Create an SSH user with a password
RUN useradd --create-home --shell /bin/bash -g root -G sudo -u 1000 user && \
    echo 'user:password' | chpasswd

# Allow SSH access and expose port 22
RUN mkdir /var/run/sshd
EXPOSE 22

# Start the SSH server
CMD ["/usr/sbin/sshd", "-D"]