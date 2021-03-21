#!/bin/bash

#Disable SeLinux
sed -i 's/^SELINUX=enforcing$/SELINUX=disabled/' /etc/selinux/config;
#Disable SWAP
sed -i '/ swap / s/^\(.*\)$/#\1/g' /etc/fstab;
# Allow TCP forwarding for ssh
sed -i 's/^#AllowTcpForwarding yes$/AllowTcpForwarding yes/' /etc/ssh/sshd_config;
# Allow SSH Tunnel 
sed -i 's/^#PermitTunnel no$/PermitTunnel yes/' /etc/ssh/sshd_config;
# Allow root login
sed -i 's/^#PermitRootLogin yes$/PermitRootLogin yes/' /etc/ssh/sshd_config;
