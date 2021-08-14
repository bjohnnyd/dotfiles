tag := "chezmoi"
user := "foo"

alias a := chezmoi-apply
alias b := build
alias bn := build-no-cache


# Test inititalization and application of dotfiles
test:
    docker build --no-cache -t {{tag}} .
    docker run --user={{user}} {{tag}} chezmoi -v apply

# Build Docker Image
build:
    docker build -t {{tag}} .

# Rebuild Docker Image from Scratch
build-no-cache:
    docker build --no-cache -t {{tag}} .

# Rebuild Docker Image from Scratch
cat-gitconfig:
    docker run {{tag}} cat .gitconfig

# Applies the users dotfiles
chezmoi-apply:
    docker run --user={{user}} {{tag}} chezmoi -v apply

