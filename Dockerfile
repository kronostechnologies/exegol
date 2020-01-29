FROM kronostechnologies/s3fs:1.85.1

RUN apt-get update && \
    apt-get install sudo ca-certificates -y && \
    mkdir -p /var/log/sudo-io
