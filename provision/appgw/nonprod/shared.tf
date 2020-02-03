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

variable "app_gw_key" {
  description = "terraform state"
  default = "nonprod.aks.01.appgw.terraform.tfstate"
}

variable "sas_token" {
  description = "sas token"
  default = "1234"
}


variable "app_gateway_sku" {
  description = "Name of the Application Gateway SKU."
  default = "Standard_v2"
}