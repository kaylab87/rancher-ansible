#!/bin/bash

# create and set domain name `k-mng.lab0.co` in DNS-servers BEFORE!

HOST_NAME=k-mng.lab0.co
LETS_EMAIL=kaylab87@yandex.ru

kubectl create namespace cattle-system

helm repo add rancher-latest https://releases.rancher.com/server-charts/latest

#helm install rancher-latest/rancher --name rancher  --namespace cattle-system --set hostname=${HOST_NAME};

###with Lets
helm upgrade --install rancher \
  rancher-latest/rancher \
  --namespace cattle-system \
  --set hostname=${HOST_NAME} \
  --set ingress.tls.source=letsEncrypt \
  --set letsEncrypt.email=${LETS_EMAIL}

kubectl -n cattle-system rollout status deploy/rancher
