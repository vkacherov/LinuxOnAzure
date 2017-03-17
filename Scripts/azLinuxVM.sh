#!/bin/bash

if [ "$#" -ne 1 ]
then
  echo "Usage: azLinuxVM UNIQUE_ID"
  exit 1
fi

echo 'Creating the resource Group rg'$1'...'
azure group create rg$1 eastus

echo 'Creating the VM...'
azure vm create --name vm$1 -u user$1 --generate-ssh-keys --resource-group rg$1 --location eastus --os-type linux --image-urn OpenLogic:CentOS:7.2:latest --nic-name vmnic$1  --public-ip-name vmpubip$1 --public-ip-domain-name vm$1 --vnet-name vnet$1 --vnet-address-prefix 10.0.0.0/16 --vnet-subnet-name subnet$1 --vnet-subnet-address-prefix 10.0.0.0/24
