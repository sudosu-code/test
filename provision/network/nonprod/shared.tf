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

variable "nw_key" {
  description = "terraform state"
  default = "nonprod.aks.01.nw.terraform.tfstate"
}

variable "sas_token" {
  description = "sas token"
  default = "1234"
}

variable "aks_virtual_network_address_prefix" {
  description = "Containers DNS server IP address."
  default     = "15.0.0.0/16"
}

variable "aks_subnet_name" {
  description = "Name of the AKS Subnet."
  default = "ak8ssubnet"
}

variable "aks_subnet_address_prefix" {
  description = "Containers DNS server IP address."
  default     = "15.0.0.0/24"
}


variable "app_gateway_subnet_name" {
  description = "Name of the Application Gateway."
  default = "appgwsubnet"
}

variable "app_gateway_subnet_address_prefix" {
  description = "Containers DNS server IP address."
  default     = "15.0.1.0/24"
}

variable "aks_service_cidr" {
  description = "Containers DNS server IP address."
  default     = "15.0.2.0/24"
}