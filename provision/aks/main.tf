provider "azurerm" {
  version = "~> 1.40"
}

terraform {
  backend "azurerm" {
    storage_account_name  = var.storage_account_name
    container_name        = var.container_name
    key                   = var.aks_key
    sas_token             = var.sas_token
  }
}
