FROM ubuntu:latest

RUN apt update && apt -qq -y install git && rm -rf /var/lib/apt/lists/*

RUN ln -s /run/secrets/gitconfig ~/.gitconfig

COPY entrypoint.sh /entrypoint.sh
COPY build_files /build_files
COPY *.sed /sed_files/

ENTRYPOINT /entrypoint.sh
