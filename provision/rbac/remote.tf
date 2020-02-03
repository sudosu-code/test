data "terraform_remote_state" "rg" {
  backend = "azurerm"
  config = {
    storage_account_name  = var.storage_account_name
    container_name        = var.container_name
    key                   = var.rg_key
    sas_token             = var.sas_token
  }
}

data "terraform_remote_state" "network" {
  backend = "azurerm"
  config = {
    storage_account_name  = var.storage_account_name
    container_name        = var.container_name
    key                   = var.nw_key
    sas_token             = var.sas_token
  }
}

data "terraform_remote_state" "appgw" {
  backend = "azurerm"
  config = {
    storage_account_name  = var.storage_account_name
    container_name        = var.container_name
    key                   = var.app_gw_key
    sas_token             = var.sas_token
  }
}


locals {
  env                           = data.terraform_remote_state.rg.environment
  id                            = data.terraform_remote_state.rg.id
  cluster_name                  = "${local.env}-aks-${local.id}"
  resource_group_name           = data.terraform_remote_state.rg.name
  resource_group_id             = data.terraform_remote_state.rg.rg_id
  location                      = data.terraform_remote_state.rg.location
  aks_subnet_id                   = data.terraform_remote_state.network.aks_subnet_id
  app_gw_nw_id                    = data.terraform_remote_state.appgw.app_gw_nw_id
  vnet_name                       = data.terraform_remote_state.network.vnet_name
  backend_address_pool_name       = "${local.vnet_name}-beap"
  frontend_port_name              = "${local.vnet_name}-feport"
  frontend_ip_configuration_name  = "${local.vnet_name}-feip"
  http_setting_name               = "${local.vnet_name}-be-htst"
  listener_name                   = "${local.vnet_name}-httplstn"
  request_routing_rule_name       = "${local.vnet_name}-rqrt"
}