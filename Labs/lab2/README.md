# A Very Simple Deployment of a Linux VM with OMS #
In this lab we'll deploy a VM using an ARM Template. In this template is new resource called a VM extension. This extends our ability to deploy software or run scripts on the VM after it's created in Azure. There are many different VM extensions, but will be using the OMS Linux VM Extension. The OMS extension installs OMS agent on the VM for us.

        {
	  "type": "Microsoft.Compute/virtualMachines/extensions",
	  "name": "[concat(variables('vmName'), '/Microsoft.EnterpriseCloud.Monitoring')]",
          "apiVersion": "[variables('apiVersion')]",
          "location": "[resourceGroup().location]",
          "dependsOn": [
            "[concat('Microsoft.Compute/virtualMachines/', variables('vmName'))]"
          ],
          "properties": {
            "publisher": "Microsoft.EnterpriseCloud.Monitoring",
	    "type": "OmsAgentForLinux",
            "typeHandlerVersion": "1.0",
            "autoUpgradeMinorVersion": true,
            "settings": {
			  "workspaceId": "[parameters('workspaceId')]"
            },
            "protectedSettings": {
			  "workspaceKey": "[parameters('workspaceKey')]"
            }
          }
        }

## Deploy a VM Running OMS
Have a look at the [201-oms-extension-ubuntu-vm](https://github.com/Azure/azure-quickstart-templates/tree/master/201-oms-extension-ubuntu-vm) folder.
        1. There is a azuredeploy.json file. It descibes the resources we want to create. It also has parameters for things like username and password.
        2. There is a azuredeploy.parameters.json file that contains the parameters to pass to the template. Customers use multiple param files to create different environments like dev, test, prod. **We will not use this for the lab.**

**Create a resource group from the Azure-CLI:**

    azure group create {RESOURCE GROUP NAME} eastus

> Replace {RESOURCE GROUP NAME} with whatever you like. The "eastus" at the end is the data center location. There something like 22+ DCs now...

**Deploy an ARM Template using the Azure-CLI:**

    azure group deployment create <my-resource-group> <my-deployment-name> --template-uri https://raw.githubusercontent.com/azure/azure-quickstart-templates/master/201-oms-extension-ubuntu-vm/azuredeploy.json/

> Replace {RESOURCE GROUP NAME} with the resource group name you just created.

> Replace {DEPLOYMENT NAME} with whatever you like.

This command creates a deployment with the resource manager and passes the URI of the OMS template. It will also prompt you for the following parameters:

1. Username (don't use "admin")
2. Password (needs to be more than 8 chars and be complex)
3. DNS Label (this will be the dns prefix used to connect to the box)
4. Storage Account Name (blob storage for VM Disks)

## SSH to your new Linux Box ##
From the command line we'll ssh to the server, feel free to poke around once connected.

    ssh username@DNS-LABLE-YOU-CREATED.eastus.cloudapp.azure.com

> On Windows and need SSH? [Download Putty](http://www.chiark.greenend.org.uk/~sgtatham/putty/download.html).

## Delete the Resource Group ##
This command will remove everything you just created!

    azure group delete {RESOURCE GROUP NAME} -q
