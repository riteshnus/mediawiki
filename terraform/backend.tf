terraform {
  required_version = ">= 1.2.1"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.30.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "test-ritesh"
    storage_account_name = "testritesh009"
    container_name       = "testlog"
    key                  = "terraform.tfstate"
  }
}
