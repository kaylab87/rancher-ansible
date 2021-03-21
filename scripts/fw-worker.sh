#!/bin/bash

#####
#####  Firewall rules for Rancher WORKER nodes (worker role)
#####

# Worker role node - Inbound rules

firewall-cmd --zone=public --add-port=80/tcp --permanent #Ingress controller (HTTP)
firewall-cmd --zone=public --add-port=443/tcp --permanent #Ingress controller (HTTPS)
firewall-cmd --zone=public --add-port=2376/tcp --permanent #Docker daemon
firewall-cmd --zone=public --add-port=8472/udp --permanent #overlay networking
firewall-cmd --zone=public --add-port=9099/tcp --permanent #local traffic
firewall-cmd --zone=public --add-port=10250/tcp --permanent #kubelet
firewall-cmd --zone=public --add-port=10254/tcp --permanent #Ingress controller
firewall-cmd --zone=public --add-port=30000-32767/tcp --permanent #Nodeport range
firewall-cmd --zone=public --add-port=30000-32767/udp --permanent #Nodeport range

# Worker role node - Outbound rules

firewall-cmd --zone=public --add-port=443/tcp --permanent #Ingress controller (HTTPS)
firewall-cmd --zone=public --add-port=6443/tcp --permanent #Kubernetes apiserver
firewall-cmd --zone=public --add-port=8472/udp --permanent #overlay networking
firewall-cmd --zone=public --add-port=9099/tcp --permanent #local traffic
firewall-cmd --zone=public --add-port=10254/tcp --permanent #Ingress controller

firewall-cmd --reload
