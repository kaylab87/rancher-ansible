#!/bin/bash

curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl;
sleep 20;
chmod +x ./kubectl;
sudo mv ./kubectl /usr/local/bin/kubectl;
