#!/bin/bash
set -e  # Para abortar se houver erros

KIND_NET_CIDR=$1
SUBNET=$2

CILIUM_IP=$(echo ${KIND_NET_CIDR} | sed "s@0.0/16@${SUBNET}.0/24@")
CILIUM_IP_START=$(echo ${KIND_NET_CIDR} | sed "s@0.0/16@${SUBNET}.150/24@")
CILIUM_IP_END=$(echo ${KIND_NET_CIDR} | sed "s@0.0/16@${SUBNET}.190/24@")

yq eval ".spec.blocks[0].cidr = \"${CILIUM_IP}\"" -i ./file/cilium-lb-ipam.yaml
yq eval ".spec.blocks[1].start = \"${CILIUM_IP_START}\"" -i ./file/cilium-lb-ipam.yaml
yq eval ".spec.blocks[1].stop = \"${CILIUM_IP_END}\"" -i ./file/cilium-lb-ipam.yaml
echo "IPs para o Cilium: ${CILIUM_IP} ${CILIUM_IP_START}-${CILIUM_IP_END}"

kubectl apply -f ./file/cilium-lb-ipam.yaml -n kube-system
kubectl apply -f ./file/cilium-lb-all-services.yaml -n kube-system
