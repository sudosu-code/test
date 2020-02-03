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


locals {
  env                           = data.terraform_remote_state.rg.environment
  id                            = data.terraform_remote_state.rg.id
  cluster_name                  = "${local.env}-aks-${local.id}"
  resource_group_name           = data.terraform_remote_state.rg.name
  location                      = data.terraform_remote_state.rg.location
  app_gw_subnet_name            = data.terraform_remote_state.network.app_gw_subnet_name
  app_gw_subnet_id              = data.terraform_remote_state.network.app_gw_subnet_id
  vnet_name                       = data.terraform_remote_state.network.vnet_name
  backend_address_pool_name       = "${local.vnet_name}-beap"
  frontend_port_name              = "${local.vnet_name}-feport"
  frontend_ip_configuration_name  = "${local.vnet_name}-feip"
  http_setting_name               = "${local.vnet_name}-be-htst"
  listener_name                   = "${local.vnet_name}-httplstn"
  request_routing_rule_name       = "${local.vnet_name}-rqrt"
}