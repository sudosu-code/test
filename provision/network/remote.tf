data "terraform_remote_state" "rg" {
  backend = "azurerm"
  config = {
    storage_account_name  = var.storage_account_name
    container_name        = var.container_name
    key                   = var.rg_key
    sas_token             = var.sas_token
  }
}

locals {
  env                 = data.terraform_remote_state.rg.environment
  id                  = data.terraform_remote_state.rg.id
  cluster_name        = "${local.env}-aks-${local.id}"
  resource_group_name = data.terraform_remote_state.rg.name
  location            = data.terraform_remote_state.rg.location
}