output "aca_subnet_id" {
    value = azurerm_subnet.aca_sn.id
    description = "The ID of the subnet created for the ACA environment"
}

output "private_subnet_id" {
    value = azurerm_subnet.private.id
    description = "The ID of the private subnet created for the PostgreSQL server"
}

output "vnet_id" {
    value = azurerm_virtual_network.aca_vnet.id
    description = "The ID of the virtual network created"
}