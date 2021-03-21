#!/bin/bash

SERVER=k-mng.lab0.co;
mkdir -p $HOME/lets-data/tls;
# Install the CustomResourceDefinition resources separately
kubectl apply -f https://github.com/jetstack/cert-manager/releases/download/v1.2.0/cert-manager.crds.yaml

sleep 20

# Create the namespace for cert-manager
kubectl create namespace cert-manager

# Add the Jetstack Helm repository
helm repo add jetstack https://charts.jetstack.io

sleep 20

# Update your local Helm chart repository cache
helm repo update

sleep 20

# Install the cert-manager Helm chart
helm install \
  cert-manager jetstack/cert-manager \
  --namespace cert-manager \
  --version v1.2.0

sleep 20

kubectl -n cert-manager rollout status deploy/cert-manager

sleep 20

openssl genrsa -out $HOME/lets-data/tls/ca.key 2048
openssl req -x509 -new -nodes -key $HOME/lets-data/tls/ca.key -subj "/CN=${SERVER}" -days 3650 -out $HOME/lets-data/tls/ca.crt -extensions v3_ca -config $HOME/lets-data/tls/openssl-with-ca.cnf

kubectl create secret tls orc-ca-keypair --cert=$HOME/lets-data/tls/ca.crt --key=$HOME/lets-data/tls/ca.key --namespace=cert-manager

sleep 20

kubectl apply -f $HOME/lets-data/certmanager/orc-ca-issuer.yaml
kubectl apply -f $HOME/lets-data/certmanager/orc-letsencrypt-issuer.yaml

