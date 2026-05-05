output "aca_host_name" {
    value = azurerm_container_app.aca_app.ingress[0].fqdn
    description = "The hostname of the Azure Container App"
}
