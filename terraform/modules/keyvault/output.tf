output "key_vault_username" {
    value = data.azurerm_key_vault_secret.username.value
    description = "The username for the PostgreSQL database stored in Key Vault"
}

output "key_vault_password" {
    value = data.azurerm_key_vault_secret.password.value
    description = "The password for the PostgreSQL database stored in Key Vault"
}