resource "azurerm_network_security_group" "aks" {
  name                = "${local.cluster_name}-nsg-aks"
  location            = local.location
  resource_group_name = local.resource_group_name

  security_rule {
    name                        = "${local.cluster_name}-nsr-aks"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "*"
    destination_port_range      = "*"
    source_address_prefixes     = [var.app_gateway_subnet_address_prefix, var.aks_subnet_address_prefix, var.aks_service_cidr]
    destination_address_prefix  = "*"
  }


}
