variable "env" {
  description = "Env to provision"
  default = "prod"
}

variable "region" {
  description = "Azure region to provision cluster"
  default = "West Europe"
}

variable "id" {
  description = "Cluster id"
  default = "01"
}

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
  default = "prod.aks.01.terraform.tfstate"
}

variable "sas_token" {
  description = "sas token"
  default = "1234"
}

