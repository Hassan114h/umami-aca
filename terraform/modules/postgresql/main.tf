resource "azurerm_private_dns_zone" "psgsql" {
  name                = var.private_dns_zone_name
  resource_group_name = var.resource_group_name
}

resource "azurerm_private_dns_zone_virtual_network_link" "link" {
  name                  = var.private_dns_vnet_link_name
  private_dns_zone_name = azurerm_private_dns_zone.psgsql.name
  virtual_network_id    = var.vnet_id  
  resource_group_name   = var.resource_group_name
}

resource "azurerm_postgresql_flexible_server" "aca_umami_server" {
  name                          = var.postgres_server_name
  resource_group_name           = var.resource_group_name
  location                      = var.location
  version                       = "18"
  delegated_subnet_id           = var.private_subnet_id
  private_dns_zone_id           = azurerm_private_dns_zone.psgsql.id
  public_network_access_enabled = false
  administrator_login           = var.key_vault_username
  administrator_password        = var.key_vault_password
  zone                          = "1"

  storage_mb   = 32768
  storage_tier = "P4"

  sku_name   = "B_Standard_B1ms"
  depends_on = [azurerm_private_dns_zone_virtual_network_link.link]

}

resource "azurerm_postgresql_flexible_server_configuration" "extension" {
  name      = "azure.extensions"
  server_id = azurerm_postgresql_flexible_server.aca_umami_server.id
  value     = "pgcrypto"
}

resource "azurerm_postgresql_flexible_server_database" "app_db" {
  name      = var.postgres_db_name
  server_id = azurerm_postgresql_flexible_server.aca_umami_server.id
  collation = "en_US.utf8"
  charset   = "UTF8"
}