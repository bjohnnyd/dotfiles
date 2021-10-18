tag := "chezmoi"
macos := "Dockerfile.macos"
ubuntu := "Dockerfile.ubuntu"

alias b := build
alias bm := build-macos
alias bn := build-no-cache
alias bnm := build-no-cache-macos

# Build Docker Image
build:
    docker build -t {{tag}} - < {{ubuntu}}

build-macos:
    docker build -t {{tag}} - < {{macos}}

# Rebuild Docker Image from Scratch
build-no-cache:
    docker build --no-cache -t {{tag}} - < {{ubuntu}}

build-no-cache-macos:
    docker build --no-cache -t {{tag}} - < {{macos}}

# Rebuild Docker Image from Scratch
cat-gitconfig:
    docker run {{tag}} cat .gitconfig
