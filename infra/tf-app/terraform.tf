terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "group11-rg"
    storage_account_name = "group11githubactions"
    container_name       = "tfstate"
    key                  = "prod.app.tfstate"
  }
}
