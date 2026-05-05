resource "azurerm_cdn_frontdoor_profile" "umami_fd_profile" {
  name                = var.fd_profile_name
  resource_group_name = var.rg_name
  sku_name            = var.fd_sku_name
}

resource "azurerm_cdn_frontdoor_endpoint" "umami_fd_endpoint" {
  name                     = var.fd_endpoint_name
  cdn_frontdoor_profile_id = azurerm_cdn_frontdoor_profile.umami_fd_profile.id
}

resource "azurerm_cdn_frontdoor_origin_group" "umami_fd_origin_group" {
  name                     = var.fd_origin_group_name
  cdn_frontdoor_profile_id = azurerm_cdn_frontdoor_profile.umami_fd_profile.id

  load_balancing {}

  health_probe {
    path                = "/"
    request_type        = "HEAD"
    protocol            = "Https"
    interval_in_seconds = 240
  }
}

resource "azurerm_cdn_frontdoor_origin" "umami_fd_origin" {
  name                          = var.fd_origin_name
  cdn_frontdoor_origin_group_id = azurerm_cdn_frontdoor_origin_group.umami_fd_origin_group.id
  enabled                       = true
  certificate_name_check_enabled = true

  host_name          = var.aca_host_name
  http_port          = 80
  https_port         = 443
  origin_host_header = var.aca_host_name
  priority           = 1
  weight             = 1
}


resource "azurerm_cdn_frontdoor_route" "umami_fd_route" {
  name                          = var.fd_route_name
  cdn_frontdoor_endpoint_id     = azurerm_cdn_frontdoor_endpoint.umami_fd_endpoint.id
  cdn_frontdoor_origin_group_id = azurerm_cdn_frontdoor_origin_group.umami_fd_origin_group.id
  cdn_frontdoor_origin_ids      = [azurerm_cdn_frontdoor_origin.umami_fd_origin.id]
  enabled                       = true

  forwarding_protocol    = "HttpsOnly"
  https_redirect_enabled = true
  patterns_to_match      = ["/*"]
  supported_protocols    = ["Http", "Https"]

  cdn_frontdoor_custom_domain_ids = [azurerm_cdn_frontdoor_custom_domain.umami_fd_custom_domain.id]
  link_to_default_domain          = true

  depends_on = [
    azurerm_cdn_frontdoor_custom_domain.umami_fd_custom_domain
  ]
}

resource "azurerm_cdn_frontdoor_custom_domain" "umami_fd_custom_domain" {
  name                     = var.fd_custom_domain_name
  cdn_frontdoor_profile_id = azurerm_cdn_frontdoor_profile.umami_fd_profile.id
  host_name                = var.fd_custom_domain_host_name

  tls {
    certificate_type    = "ManagedCertificate"
    minimum_tls_version = "TLS12"
  }
}

