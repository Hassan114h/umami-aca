variable "log_analytics_name" {
  type        = string
  default     = "umami-aca-logs"
}

variable "rg_name" {
  type        = string
  default     = "IAC-UMAMI-ACA"
}

variable "sku" {
  type        = string
  default     = "PerGB2018"
}

variable "location" {
  type        = string
  default     = "UK South"
}

variable "retention_in_days" {
  type        = number
  default     = 30
}

variable "aca_environment" {
  type        = string
  default     = "ACA-Environment"
}

variable "public_access" {
  type        = string
  default     = "Enabled"
}

variable "acr_name" {
  type        = string
  default     = "ACRUMAMI"
}

variable "acr_login_server" {
  type        = string
  default     = "acrumami-hxgdgxccgnd6gted.azurecr.io"
}

variable "aca_app_name" {
  type        = string
  default     = "umami-aca-app"
}

variable "revision_mode" {
  type        = string
  default     = "Single"
}

variable "aca_container" {
  type        = string
  default     = "umami-aca-container"
}

variable "container_cpu" {
  type        = number
  default     = 0.25
}

variable "container_memory" {
  type        = string
  default     = "0.5Gi"
}

variable "identity_name" {
  type        = string
  default     = "aca-umami-identity"
}

variable "acr_role_definition_name" {
  type        = string
  default     = "AcrPull"
}

variable "identity_type" {
  type        = string
  default     = "UserAssigned"
}

variable "infrastructure_subnet_id" {
  type        = string
  description = "The ID of the subnet created for the ACA environment"
}

variable "key_vault_username" {
  type        = string
  description = "The username for the PostgreSQL database stored in Key Vault"
}

variable "key_vault_password" {
  type        = string
  description = "The password for the PostgreSQL database stored in Key Vault"
}