resource "azurerm_network_ddos_protection_plan" "aksddos" {
  name                = "${local.cluster_name}-ddos-protection-plan"
  location            = local.location
  resource_group_name = local.resource_group_name
}