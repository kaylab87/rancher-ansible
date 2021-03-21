#!/bin/bash

# create and set domain name `k-mng.lab0.co` in DNS-servers BEFORE!
# This hostname shoud point to the one of the worker host.

HOST_NAME=k-mng.lab0.co

kubectl apply --validate=false -f https://github.com/jetstack/cert-manager/releases/download/v0.14.1/cert-manager.yaml;

kubectl create namespace cattle-system;

helm install rancher rancher-latest/rancher --namespace cattle-system --set hostname=${HOST_NAME};
