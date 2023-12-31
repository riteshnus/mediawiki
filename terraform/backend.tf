terraform {
  required_version = ">= 1.2.1"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.30.0"
    }
  }
  backend "local" {}
}
