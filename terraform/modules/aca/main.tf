 resource "azurerm_log_analytics_workspace" "logs" {
   name                = var.log_analytics_name
   location            = var.location
   resource_group_name = var.rg_name
   sku                 = var.sku
   retention_in_days   = var.retention_in_days
 }

 resource "azurerm_container_app_environment" "ACA_Environment" {
   name                       = var.aca_environment
   location                   = var.location
   resource_group_name        = var.rg_name
   public_network_access      = var.public_access
   log_analytics_workspace_id = azurerm_log_analytics_workspace.logs.id
   infrastructure_subnet_id  = var.infrastructure_subnet_id  
 }

data "azurerm_container_registry" "umami" {
  name                = var.acr_name
  resource_group_name = var.rg_name
}

 resource "azurerm_container_app" "aca_app" {
  name                         = var.aca_app_name
  container_app_environment_id = azurerm_container_app_environment.ACA_Environment.id
  resource_group_name          = var.rg_name
  revision_mode                = var.revision_mode

  ingress {
    target_port = 3000
    external_enabled = true
    traffic_weight {
        latest_revision = true
        percentage = 100
    }
   }
  
  identity {
    type         = var.identity_type
    identity_ids = [azurerm_user_assigned_identity.aca_identity.id]
  }

  registry {
    server   = data.azurerm_container_registry.umami.login_server
    identity = azurerm_user_assigned_identity.aca_identity.id
  }

  template {
    container {
      name   = var.aca_container
      image = "${var.acr_login_server}/umami:v1"
      cpu    = var.container_cpu
      memory = var.container_memory

      env {
        name  = "DATABASE_URL"
        value = "postgresql://${var.key_vault_username}:${urlencode(var.key_vault_password)}@umami-psqlflexibleserver.postgres.database.azure.com:5432/umami?sslmode=verify-full"
    }
  }   
 }
}

resource "azurerm_user_assigned_identity" "aca_identity" {
  name                = var.identity_name
  location            = var.location
  resource_group_name = var.rg_name
}

resource "azurerm_role_assignment" "aca_acr_pull" {
  scope                = data.azurerm_container_registry.umami.id
  role_definition_name = var.acr_role_definition_name
  principal_id         = azurerm_user_assigned_identity.aca_identity.principal_id
}
