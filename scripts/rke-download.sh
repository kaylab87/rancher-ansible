#!/bin/bash

curl -s https://api.github.com/repos/rancher/rke/releases/latest | grep download_url | grep rke_linux-amd64 | cut -d '"' -f 4 | wget -qi -;
sleep 20;
chmod +x ./rke_linux-amd64;
mv ./rke_linux-amd64 /usr/local/bin/rke;
