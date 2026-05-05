terraform {
  backend "azurerm" {
    resource_group_name  = "IAC-UMAMI-ACA"
    storage_account_name = "xumamiproject"
    container_name       = "tfstate"
    key                  = "prod.terraform.tfstate"
  }
}