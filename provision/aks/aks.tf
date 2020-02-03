resource "azurerm_kubernetes_cluster" "aks" {
  name                = local.cluster_name
  location            = var.region
  resource_group_name = local.resource_group_name
  dns_prefix          = local.cluster_name
  kubernetes_version  = var.k8s_version

  linux_profile {
    admin_username = var.vmss_node_user_name

    ssh_key {
      key_data = file(local.ssh_public_key)
    }
  }

  agent_pool_profile {
    type                = "VirtualMachineScaleSets"
    vnet_subnet_id      = local.aks_subnet_id
    name                = "${local.cluster_name}-vmss"
    availability_zones  = var.availability_zones
    enable_auto_scaling = var.enable_auto_scaling
    min_count           = var.min_count
    max_count           = var.max_count
    max_pods            = var.max_pods
    vm_size             = var.agent_sku
    os_type             = "Linux"
    os_disk_size_gb     = 30
  }

  network_profile {
    network_plugin      = "azure"
    load_balancer_sku   = "standard"
    dns_service_ip      = var.aks_dns_service_ip
    docker_bridge_cidr  = var.aks_docker_bridge_cidr
    service_cidr        = local.aks_service_cidr
  }

  service_principal {
    client_id     = var.client_id
    client_secret = var.client_secret
  }

  role_based_access_control {
    enabled = true
  }

  addon_profile {
    http_application_routing {
      enabled = false
    }
  }
}
