variable "env" {
  description = "Env to provision"
  default = "test"
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
  default = "testsa"
}

variable "container_name" {
  description = "container name"
  default = "tfstate"
}

variable "rg_key" {
  description = "terraform state"
  default = "test.aks.01.terraform.tfstate"
}

variable "sas_token" {
  description = "sas token"
  default = "1234"
}

