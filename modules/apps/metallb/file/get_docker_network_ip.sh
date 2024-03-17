#!/bin/bash

KIND_NET_CIDR=$(docker network inspect kind -f '{{(index .IPAM.Config )}}' | grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}/[0-9]{1,2}")
METALLB_IP_START=$(echo ${KIND_NET_CIDR} | sed "s@0.0/16@100.240@")
METALLB_IP_END=$(echo ${KIND_NET_CIDR} | sed "s@0.0/16@100.250@")
METALLB_IP_RANGE="${METALLB_IP_START}-${METALLB_IP_END}"


cat <<EOF
apiVersion: metallb.io/v1beta1
kind: IPAddressPool
metadata:
  name: main-address
spec:
  addresses:
  - ${METALLB_IP_RANGE}
---
apiVersion: metallb.io/v1beta1
kind: L2Advertisement
metadata:
  name: default
spec:
  ipAddressPools:
  - main-address
EOF