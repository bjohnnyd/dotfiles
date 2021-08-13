#!/usr/bin/env sh

set -o errexit

xst_version="master"

cyan=$'\033[96m'
white=$'\033[0;97m'
yellow=$'\033[93m'
endc=$'\033[0m'

start() {
  echo "$cyan--------------------------------------------------$endc"
  echo "$cyan-->$white $1 $endc"
  echo ""
}


msg() {
  echo "$yellow--------------------------------------------------$endc"
  echo "$yellow-->$white $1 $endc"
  echo ""
}

end() {
  echo ""
  echo "$cyan-->$white End for $0 $endc"
  echo "$cyan--------------------------------------------------$endc"
}

start "Starting $0..."
msg   "Processing $0..."
end   "Ending $0..."
