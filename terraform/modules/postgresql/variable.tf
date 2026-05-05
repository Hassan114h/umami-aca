variable "private_dns_zone_name" {
  description = "Name of the private DNS zone"
  type        = string
  default     = "privatelink.postgres.database.azure.com"
}

variable "resource_group_name" {
  type        = string
  default     = "IAC-UMAMI-ACA"
}

variable "private_dns_vnet_link_name" {
  description = "Name of the private DNS zone virtual network link"
  type        = string
  default     = "ACAVnetZone.com"
}

variable "postgres_server_name" {
  description = "Name of the PostgreSQL Flexible Server"
  type        = string
  default     = "umami-psqlflexibleserver"
}

variable "location" {
  description = "Azure region for resources"
  type        = string
  default     = "UK South"
}

variable "postgres_db_name" {
  description = "Name of the PostgreSQL database"
  type        = string
  default     = "umami"
}

variable "vnet_id" {
  description = "ID of the virtual network"
  type        = string
}

variable "private_subnet_id" {
  description = "ID of the private subnet"
  type        = string
}

variable "key_vault_username" {
  type        = string
  description = "The username for the PostgreSQL database stored in Key Vault"
}

variable "key_vault_password" {
  type        = string
  description = "The password for the PostgreSQL database stored in Key Vault"
}