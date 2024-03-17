#!/bin/bash

set -euo pipefail

# ###################
# #dns resolv #

sudo chattr -i /etc/resolv.conf
echo "nameserver 8.8.8.8 \nnameserver 1.1.1.1" | sudo tee /etc/resolv.conf




###################
#Install ansible #

if ! hash dnsmasq >/dev/null 2>&1; then
    echo -e "\nInstalling Ansible..."
    sudo apt-get update -qq
    sudo apt-get install software-properties-common dnsmasq -y
else
    echo -e "\ndnsmasq configured"
   IPLB=$(kubectl get svc ingress-nginx-controller -n ingress-nginx -o json | jq -r '.status.loadBalancer.ingress[].ip')

   echo "address=/kind.local/$IPLB" | sudo tee /etc/dnsmasq.d/hosts.conf
   sudo systemctl restart dnsmasq
   systemctl status dnsmasq
fi

