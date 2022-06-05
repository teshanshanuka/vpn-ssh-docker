#!/bin/sh -e

[ -f vpn.auth ] || { echo 'Create a `vpn.auth` file here with your vpn username and password, before running this script' && exit 1; }

if ! docker info > /dev/null 2>&1; then  echo "Install docker to continue" && exit 1; fi

[ $# -eq 1 ] || { echo "Usage: ./create.sh <ovpn_file>" && exit 1; }

[ -f vpn.conf ] || sed 's|\(auth-user-pass\)|\1 /vpn/vpn.auth|' $1 > vpn.conf
docker build -t vpnssh \
    --build-arg UNAME=$USER \
    --build-arg UID=$(id -u) \
    --build-arg GID=$(id -g) \
    .

echo 'Please delete the `vpn.auth` file!'
