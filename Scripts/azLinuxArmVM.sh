#!/bin/bash

if [ "$#" -ne 1 ]
then
  echo "Usage: azLinuxArmVM UNIQUE_ID"
  exit 1
fi

echo 'Creating the resource Group rg'$1'...'
azure group create rg$1 eastus

echo 'Creating the VM from  ARM template...'
azure group deployment create rg$1 vm$1 --template-uri https://raw.githubusercontent.com/Azure/azure-quickstart-templates/master/101-vm-simple-linux/azuredeploy.json
