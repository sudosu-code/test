variable "storage_account_name" {
  description = "storage account name"
  default = "prodsa"
}

variable "container_name" {
  description = "container name"
  default = "tfstate"
}

variable "rg_key" {
  description = "terraform state"
  default = "prod.aks.01.rg.terraform.tfstate"
}

variable "nw_key" {
  description = "terraform state"
  default = "prod.aks.01.nw.terraform.tfstate"
}

variable "app_gw_key" {
  description = "terraform state"
  default = "prod.aks.01.appgw.terraform.tfstate"
}

variable "rbac_key" {
  description = "terraform state"
  default = "prod.aks.01.rbac.terraform.tfstate"
}

variable "sas_token" {
  description = "sas token"
  default = "1234"
}

variable "aks_service_principal_object_id" {
  description = "Object ID of the service principal."
}