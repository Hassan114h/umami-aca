variable "rg_name" {
  type        = string
  default     = "IAC-UMAMI-ACA"
}

variable "fd_profile_name" {
  type        = string
  default     = "umami-fd-profile"
}

variable "fd_sku_name" {
  type        = string
  default     = "Standard_AzureFrontDoor"
}

variable "fd_endpoint_name" {
  type        = string
  default     = "umami-fd-endpoint"
}

variable "fd_origin_group_name" {
  type        = string
  default     = "umami-fd-origingroup"
}

variable "fd_origin_name" {
  type        = string
  default     = "umami-fd-origin"
}

variable "fd_route_name" {
  type        = string
  default     = "umami-fd-route"
}

variable "fd_custom_domain_name" {
  type        = string
  default     = "umami-fd-custom-domain"
}

variable "fd_custom_domain_host_name" {
  type        = string
  default     = "nginxhassan.com"
}

variable "aca_host_name" {
    type        = string
}