# # Locals block for hardcoded names.
locals {

  app_gate_way_name             = "${local.cluster_name}-app-gw"
  app_gate_way_config           = "${local.app_gate_way_name}-config"
  app_gate_way_public_ip        = "${local.app_gate_way_name}-public-ip"
  user_identity                 = "${local.cluster_name}-identity"
}

# User Assigned Idntities
resource "azurerm_user_assigned_identity" "identity" {
  resource_group_name = local.resource_group_name
  location            = local.location
  name                = local.user_identity
  tags = {
    environment = local.env
  }
}
