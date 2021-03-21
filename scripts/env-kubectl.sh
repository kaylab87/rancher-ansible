#!/bin/bash

#####
#####  Add kubernetes env. settings
#####


mkdir -p $HOME/.kube;
cd ~/settings;
cp -i kube_config_cluster.yml $HOME/.kube/config;
chown $(id -u):$(id -g) $HOME/.kube/config;
