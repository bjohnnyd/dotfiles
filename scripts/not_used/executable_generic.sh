#!/usr/bin/env sh

set -o errexit

xst_version="master"

cyan=$'\e[0;96m'
white=$'\e[0;97m'
endc=$'\e[0m'

msg() {
  echo "$cyan--------------------------------------------------$endc"
  echo "$cyan-->$white $1 $endc"
  echo ""
}

bye() {
  echo ""
  echo "$cyan-->$white End for $0 $endc"
  echo "$cyan--------------------------------------------------$endc"
}

msg "Execute $0..."
