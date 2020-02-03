resource "azurerm_role_assignment" "ra1" {
  scope                 = local.aks_subnet_id
  role_definition_name  = "Network Contributor"
  principal_id          =  var.aks_service_principal_object_id
  depends_on            = [data.terraform_remote_state.network]
}

resource "azurerm_role_assignment" "ra2" {
  scope                = azurerm_user_assigned_identity.identity.id
  role_definition_name = "Managed Identity Operator"
  principal_id         =  var.aks_service_principal_object_id
  depends_on           = [azurerm_user_assigned_identity.identity]
}

resource "azurerm_role_assignment" "ra3" {
  scope                = local.app_gw_nw_id
  role_definition_name = "Contributor"
  principal_id         = azurerm_user_assigned_identity.identity.principal_id
  depends_on           = [azurerm_user_assigned_identity.identity, data.terraform_remote_state.appgw]
}

resource "azurerm_role_assignment" "ra4" {
  scope                = local.resource_group_id
  role_definition_name = "Reader"
  principal_id         = azurerm_user_assigned_identity.identity.principal_id
  depends_on           = [azurerm_user_assigned_identity.identity, data.terraform_remote_state.appgw]
}