FROM ubuntu:focal

ARG github_username=bjohnnyd
ENV LANG=C.UTF-8 LC_ALL=C.UTF-8 GITHUB_USER=$github_username EDITOR=vim

RUN apt-get update && \
    apt-get install git curl -y && \
    rm -rf /var/lib/apt/lists/*

RUN useradd -m foo
USER foo
WORKDIR /home/foo

# Running without -p ensures that error is thrown if user foo is not created
RUN mkdir /home/foo/.config && mkdir /home/foo/.config/chezmoi
COPY tests/chezmoi.test.toml /home/foo/.config/chezmoi/chezmoi.toml

RUN sh -c "$(curl -fsLS git.io/chezmoi)" -- init -v --apply $GITHUB_USER
