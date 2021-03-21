#!/bin/bash

#Download and install Docker
curl https://releases.rancher.com/install-docker/19.03.sh | sh;

sleep 120;

#Add user Zaza to docker group

usermod -aG docker zaza;

systemctl enable --now docker;
systemctl restart docker;
