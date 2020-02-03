# # Locals block for hardcoded names.
locals {

  app_gate_way_name             = "${local.cluster_name}-app-gw"
  app_gate_way_config           = "${local.app_gate_way_name}-config"
  app_gate_way_public_ip        = "${local.app_gate_way_name}-public-ip"
  user_identity                 = "${local.cluster_name}-identity"
}



# Public Ip
resource "azurerm_public_ip" "extip" {
  name                         = local.app_gate_way_public_ip
  location                     = local.location
  resource_group_name          = local.resource_group_name
  allocation_method            = "Static"
  sku                          = "Standard"
  tags = {
    environment = local.env
  }
}

resource "azurerm_application_gateway" "network" {
  name                = local.app_gate_way_name
  resource_group_name = local.resource_group_name
  location            = local.location

  sku {
    name     = var.app_gateway_sku
    tier     = "Standard_v2"
    capacity = 2
  }

  gateway_ip_configuration {
    name      = local.app_gate_way_config
    subnet_id = local.app_gw_subnet_id
  }

  frontend_port {
    name = local.frontend_port_name
    port = 80
  }

  frontend_port {
    name = "httpsPort"
    port = 443
  }

  frontend_ip_configuration {
    name                 = local.frontend_ip_configuration_name
    public_ip_address_id = azurerm_public_ip.extip.id
  }

  backend_address_pool {
    name = local.backend_address_pool_name
  }

  backend_http_settings {
    name                  = local.http_setting_name
    cookie_based_affinity = "Disabled"
    port                  = 80
    protocol              = "Http"
    request_timeout       = 1
  }

  http_listener {
    name                           = local.listener_name
    frontend_ip_configuration_name = local.frontend_ip_configuration_name
    frontend_port_name             = local.frontend_port_name
    protocol                       = "Http"
  }

  request_routing_rule {
    name                       = local.request_routing_rule_name
    rule_type                  = "Basic"
    http_listener_name         = local.listener_name
    backend_address_pool_name  = local.backend_address_pool_name
    backend_http_settings_name = local.http_setting_name
  }

  tags = {
    environment = local.env
  }

  depends_on = [azurerm_public_ip.extip]
}

