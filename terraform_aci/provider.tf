terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "rg-vladimir-tfstate"
    storage_account_name = "stvladimirtfstate1987"
    container_name       = "tfstate"
    key                  = "hellogo-aci.tfstate"
  }
}

provider "azurerm" {
  features {}
}