variable "storage_account_name" {
  description = "storage account name"
  default = "nonprodsa"
}

variable "container_name" {
  description = "container name"
  default = "tfstate"
}

variable "rg_key" {
  description = "terraform state"
  default = "nonprod.aks.01.rg.terraform.tfstate"
}

variable "aks_key" {
  description = "terraform state"
  default = "nonprod.aks.01.aks.terraform.tfstate"
}

variable "nw_key" {
  description = "terraform state"
  default = "nonprod.aks.01.nw.terraform.tfstate"
}

variable "sas_token" {
  description = "sas token"
  default = "1234"
}

variable "env" {
  description = "Env to provision"
  default = "nonprod"
}

variable "region" {
  description = "Azure region to provision cluster"
  default = "West Europe"
}

variable "id" {
  description = "Cluster id"
  default = "01"
}

variable "k8s_version" {
  description = "K8S version"
  default = "1.15.7"
}

variable "vmss_node_user_name" {
  description = "User name of a node on VMSS"
  default = "ubuntu"
}

variable "availability_zones" {
  description = "nodes on availablity zones"
  default = [1]
}

variable "enable_auto_scaling" {
  description = "Enable cluster auto scaling"
  default = true
}

variable "min_count" {
  description = "Min nodes"
  default = 1
}

variable "max_count" {
  description = "Max nodes"
  default = 2
}

variable "max_pods" {
  description = "Max pods per node"
  default = 30
}

variable "agent_sku" {
  description = "Azure SKU"
  default = "Standard_D2s_v3"
}

variable "aks_dns_service_ip" {
  description = "Containers DNS server IP address."
  default     = "15.0.2.10"
}

variable "aks_docker_bridge_cidr" {
  description = "A CIDR notation IP for Docker bridge."
  default     = "172.17.0.1/16"
}

variable "client_id" {
  description = "Client id with contribute permission"
}
variable "client_secret" {
  description = "Client secret corresponding with client id"
}