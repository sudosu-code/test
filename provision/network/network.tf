resource "azurerm_virtual_network" "aks" {
  name                = "${local.cluster_name}-network"
  location            = local.location
  resource_group_name = local.resource_group_name
  address_space       = [var.aks_virtual_network_address_prefix]

  subnet {
    address_prefix = var.app_gateway_subnet_address_prefix
    name = var.app_gateway_subnet_name
  }

  ddos_protection_plan {
    enable = true
    id = azurerm_network_ddos_protection_plan.aksddos.id
  }
  depends_on = [data.terraform_remote_state.rg, azurerm_network_ddos_protection_plan.aksddos]
}

resource "azurerm_subnet" "aks" {
  name                  = var.aks_subnet_name
  resource_group_name   = local.resource_group_name
  virtual_network_name  = azurerm_virtual_network.aks.name
  address_prefix        = var.aks_subnet_address_prefix
  service_endpoints     = ["Microsoft.AzureCosmosDB"]
}

resource "azurerm_subnet_network_security_group_association" "aks" {
  network_security_group_id = azurerm_network_security_group.aks.id
  subnet_id                 = azurerm_subnet.aks.id
}

data "azurerm_subnet" "appgw" {
  name                 = var.app_gateway_subnet_name
  resource_group_name  = local.resource_group_name
  virtual_network_name = azurerm_virtual_network.aks.name
}

