tag := "chezmoi"
macos := "Dockerfile.macos"
ubuntu := "Dockerfile.ubuntu"

alias a  := chezmoi-apply
alias b := build
alias bm := build-macos
alias bn := build-no-cache
alias bnm := build-no-cache-macos

alias ba := build-and-apply
alias bam := build-and-apply-macos

# Test application of dotfiles
test:
    docker run -it {{tag}} chezmoi -v apply

# Test inititalization and application of dotfiles
build-and-apply:
    docker build --no-cache -t {{tag}} - < {{ubuntu}}
    docker run -it {{tag}} chezmoi -v apply

build-and-apply-macos:
    docker build --no-cache -t {{tag}} - < {{macos}}
    docker run -it {{tag}} chezmoi -v apply

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

# Applies the users dotfiles
chezmoi-apply:
    docker run {{tag}} chezmoi -v apply
