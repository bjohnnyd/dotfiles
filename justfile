tag := "chezmoi"
user := "foo"

alias a  := chezmoi-apply
alias b  := build
alias bn := build-no-cache
alias ba := build-and-apply


# Test inititalization and application of dotfiles
build-and-apply:
    docker build --no-cache -t {{tag}} .
    docker run -it {{tag}} chezmoi -v apply

# Test application of dotfiles
test:
    docker run -it {{tag}} chezmoi -v apply

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
    docker run {{tag}} chezmoi -v apply
