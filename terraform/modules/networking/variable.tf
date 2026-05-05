variable "rg_name" {
  type        = string
  default     = "IAC-UMAMI-ACA"
}

variable "vnet_name" {
  type        = string
  default     = "aca-vnet"
}

variable "location" {
  type        = string
  default     = "UK South"
}

variable "aca_subnet_name" {
  description = "Name of the Azure Container Apps subnet"
  type        = string
  default     = "aca-sn"
}

variable "private_subnet_name" {
  description = "Name of the private subnet"
  type        = string
  default     = "private-sn"
}
