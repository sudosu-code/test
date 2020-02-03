output "ddos_name" {
  value = azurerm_network_ddos_protection_plan.aksddos.name
}

output "ddos_id" {
  value = azurerm_network_ddos_protection_plan.aksddos.id
}

output "vnet_name" {
  value = azurerm_virtual_network.aks.name
}

output "vnet_id" {
  value = azurerm_virtual_network.aks.id
}

output "aks_subnet_name" {
  value = azurerm_subnet.aks.name
}

output "aks_subnet_id" {
  value = azurerm_subnet.aks.id
}

output "aks_service_cidr" {
  value = var.aks_service_cidr
}

output "app_gw_subnet_name" {
  value = data.azurerm_subnet.appgw.name
}

output "app_gw_subnet_id" {
  value = data.azurerm_subnet.appgw.id
}

