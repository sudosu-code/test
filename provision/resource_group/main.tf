provider "azurerm" {
  version = "~> 1.40"
}

terraform {
  backend "azurerm" {
    storage_account_name  = var.storage_account_name
    container_name        = var.container_name
    key                   = var.rg_key
    sas_token             = var.sas_token
  }
}


resource "azurerm_resource_group" "aks" {
  name     = "${var.env}-aks-${var.id}-rg"
  location = var.region
  tags = {
    environment = var.env
  }
}