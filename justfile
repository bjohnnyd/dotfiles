tag := "chezmoi"

alias b := build
alias bn := build-no-cache


# Build Docker Image
build:
    docker build -t {{tag}} .

# Rebuild Docker Image from Scratch
build-no-cache:
    docker build --no-cache -t {{tag}} .

# Rebuild Docker Image from Scratch
cat-gitconfig:
    docker run {{tag}} cat .gitconfig

