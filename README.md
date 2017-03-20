# Linux On Azure Workshop
This is workshop is an introduction to Linux capabilities on the Microsoft Azure platform. 

## Resources ##
* [http://aka.ms/linuxazure](http://aka.ms/linuxazure)
* [Introduction to Linux on Azure](https://docs.microsoft.com/en-us/azure/virtual-machines/virtual-machines-linux-intro-on-azure)
* [Installing Bash on Windows](https://msdn.microsoft.com/en-us/commandline/wsl/install_guide)

## Lab Azure Setup:  ##
This will setup cmd line access to Azure and works on OSX, Linux, even Windows....

* Setup Step One 	- [Install Azure CLI](Setup/xplat-cli-install.md)
* Setup Step Two 	- [Login to Azure CLI](Setup/xplat-cli-login.md)
* Setup Step Three 	- [Switch Azure CLI to ARM Mode](Setup/xplat-cli-arm.md)

## Lab One: Getting Familiar with Azure Resource Manager ##
This lab will get you familiar with using the Azure CLI for deploying resources to Azure. We'll use Azure Resource Manager (ARM) Templates to describe what we want created in Azure. For More information about ARM and ARM Templates see: [Azure Resource Manager Overview](Labs/labone/arm-overview.md).

* [Deploy a simple Linux VM using the Quick Start Templates and the Azure CLI](Labs/lab1/README.md)
 
## Lab Two: Run OMS on a Linux VM in Azure ##
In this lab you will introduce the VM extensions, setup a Linux VM just like in lab1, but it will have an OMS agent pre-installed and pre-configured.

* [Deploy a Linux OMS VM using the Quick Start Template](Labs/lab2/README.md)

