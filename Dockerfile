# Use the Ubuntu docker image
FROM ubuntu

# Run the commands as root
USER root

# Set the working directory
WORKDIR /opt/ipfs

# Set required environment variable for use in IPFS
ENV IPFS_PATH=/opt/ipfs

# Update packages and install wget
RUN apt update && apt install wget -y

# Download the IPFS executable package, and extract it
RUN wget https://dist.ipfs.io/ipfs-update/v1.7.1/ipfs-update_v1.7.1_linux-amd64.tar.gz && tar -xvzf ipfs-update_v1.7.1_linux-amd64.tar.gz

# Run the IPFS update install script
RUN ipfs-update/install.sh

# Run the next IPFS update script
RUN /usr/local/bin/ipfs-update/ipfs-update install latest

# Initialize IPFS
RUN ipfs init --profile server

# Expose port 4041 so other nodes can get content
EXPOSE 4001

# Copy in the setup script and run it
COPY ./docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
