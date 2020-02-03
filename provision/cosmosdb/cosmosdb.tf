resource "azurerm_cosmosdb_account" "db" {
  name                = "${local.cluster_name}-db"
  location            = local.location
  resource_group_name = local.resource_group_name
  offer_type          = "Standard"
  kind                = "GlobalDocumentDB"

  enable_automatic_failover = true
  is_virtual_network_filter_enabled = true

  virtual_network_rule {
    id = local.aks_subnet_id
  }

  consistency_policy {
    consistency_level       = "BoundedStaleness"
    max_interval_in_seconds = 300
    max_staleness_prefix    = 100001
  }

  geo_location {
    prefix            = "${local.cluster_name}-db-customid"
    location          = local.location
    failover_priority = 0
  }

  tags {
    environment = local.env
  }
}