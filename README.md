# MediaWiki Deployment with Terraform and Ansible

Automate the deployment of [MediaWiki](https://www.mediawiki.org/) using Terraform in Microsoft Azure and Ansible. This repository provides a set of Terraform scripts and Ansible playbooks to set up and configure MediaWiki on a virtual machine in the Azure cloud. With terraform used local state managment for this assignment, but can work with remote state management. 
Used 2 layer architecture, First as App tier for application deployment on VM and Second data dabase tier to deploy the MSSQL in azure cloud.  

## Table of Contents

- [Prerequisites](#prerequisites)
- [Usage](#usage)
- [Directory Structure](#directory-structure)
- [Contributing](#contributing)
- [License](#license)

## Prerequisites

Before you begin, ensure you have met the following requirements:

- An [Azure](https://azure.com) account with the necessary permissions.
- [Terraform](https://www.terraform.io/) installed on your local machine.
- [Ansible](https://www.ansible.com/) installed on your local machine.
- An SSH keypair for authentication to the Azure VM.

## Usage

1. Clone this repository to your local machine:

   ```shell
   git clone https://github.com/riteshnus/mediawiki.git
2. Run the `init.sh` for terraform init and plan. I used terraform workspace to provide extensive feature of using same module for other relases. 
3. Run the `deploy_mediawiki.sh` to apply terraform in auto-approve mode using dev.tfvars. It will output the requred variable in secure mode to Ansible scripts. Subsequently it will run the anisible module to deploy required library on VM and install mediawiki.