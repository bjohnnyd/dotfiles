FROM ubuntu:focal

ARG github_username=bjohnnyd
ENV LANG=C.UTF-8 LC_ALL=C.UTF-8 GITHUB_USER=$github_username

RUN apt-get update && \
    apt-get install git curl -y && \
    rm -rf /var/lib/apt/lists/*

RUN sh -c "$(curl -fsLS git.io/chezmoi)" -- init --apply $GITHUB_USER
