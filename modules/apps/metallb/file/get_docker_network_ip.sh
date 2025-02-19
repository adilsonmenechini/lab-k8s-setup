#!/bin/bash

RANDOM_NUMBER_START=$(shuf -i 10-20 -n 1)
RANDOM_NUMBER_END=$(shuf -i 40-50 -n 1)
KIND_NET_CIDR=$(docker network inspect kind -f '{{(index .IPAM.Config )}}' | grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}/[0-9]{1,2}")
METALLB_IP_START=$(echo ${KIND_NET_CIDR} | sed "s@0/16@2${RANDOM_NUMBER_START}@")
METALLB_IP_END=$(echo ${KIND_NET_CIDR} | sed "s@0/16@2${RANDOM_NUMBER_END}@")
METALLB_IP_RANGE="${METALLB_IP_START}-${METALLB_IP_END}"

cat <<EOF
apiVersion: metallb.io/v1beta1
kind: IPAddressPool
metadata:
  name: first-pool
spec:
  addresses:
  - ${METALLB_IP_RANGE}
---
apiVersion: metallb.io/v1beta1
kind: L2Advertisement
metadata:
  name: example
EOF