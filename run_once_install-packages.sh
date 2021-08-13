#!/usr/bin/env sh

set -o errexit

cyan=$'\033[96m'
white=$'\033[0;97m'
yellow=$'\033[93m'
endc=$'\033[0m'

start() {
  echo "$cyan--------------------------------------------------$endc"
  echo "$cyan-->$white Starting $1... $endc"
  echo ""
}


msg() {
  echo "$yellow--------------------------------------------------$endc"
  echo "$yellow-->$white $1 $endc"
}

end() {
  echo ""
  echo "$cyan-->$white Ending $1 $endc"
  echo "$cyan--------------------------------------------------$endc"
}

setupGit()
{
    start "Github Install and Update"
    add-apt-repository ppa:git-core/ppa
    apt-get update
    msg "Installing git-flow and git"
    apt-get install git git-flow -y
    end "Github Install and Update"

}

installZotero ()
{
    start "Zotero Install"
    msg "adding smathot/cogscinl ppa to software source list"
    add-apt-repository ppa:smathot/cogscinl
    apt-get update
    msg "zotero install started"
    apt-get install zotero-standalone
    end "Zotero Install"
}

updateVim ()
{
    start "Newest VIM Install"
    msg "adding jonathonf/vim ppa to software source list"
    add-apt-repository ppa:jonathonf/vim
    apt-get update
    msg "updating VIM"
    apt-get install vim -y
    end "Newest VIM Install"
}

installConda ()
{
    start "Conda Install"
    if [ $1 == "Anaconda3" ];
    then
        CONDA_URL=https://repo.continuum.io/archive/Anaconda3-2020.02-Linux-x86_64.sh
        msg "Installing Anaconda3"
    else
        msg "Installing Miniconda3"
        CONDA_URL=https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
    fi

    wget $CONDA_URL -O ~/Conda-latest-Linux.sh
    bash ~/Conda-latest-Linux.sh -b
    rm -rf ~/Conda-latest-Linux.sh

    end "Conda Install"
}

installOHMYZSH ()
{
    echo "ZSH and Oh-My-Zsh Install"
    apt install zsh -y
    chsh -s $(which zsh)
    sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    end "ZSH and Oh-My-Zsh Install"
}

installVScode (){}

