output "id" {
  value = var.id
}

output "rg_id" {
  value = azurerm_resource_group.aks.id
}

output "name" {
  value = azurerm_resource_group.aks.name
}

output "location" {
  value = azurerm_resource_group.aks.location
}

output "environment" {
  value = azurerm_resource_group.aks.tags.environment
}