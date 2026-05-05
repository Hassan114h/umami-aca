module "aca" {
   source = "./modules/aca"
   infrastructure_subnet_id = module.networking.aca_subnet_id 
   key_vault_username = module.keyvault.key_vault_username
   key_vault_password = module.keyvault.key_vault_password
   depends_on = [module.postgresql]
}

module "front_door" { 
   source = "./modules/front_door"
   aca_host_name = module.aca.aca_host_name
   depends_on = [module.aca]
}

module "keyvault" {
   source = "./modules/keyvault"
}

module "networking" {
   source = "./modules/networking"
}

module "postgresql" {
   source = "./modules/postgresql"
   vnet_id = module.networking.vnet_id
   private_subnet_id = module.networking.private_subnet_id
   key_vault_username = module.keyvault.key_vault_username
   key_vault_password = module.keyvault.key_vault_password
   depends_on = [module.networking]
}