module "networking" {
  source   = "./modules/network"
  location = "Canada Central"
}
module "aks" {
  source                = "./modules/aks"
  location              = var.location
  resource_group_name   = module.network.resource_group_name
  vnet_subnet_id_test   = module.network.test_subnet_id
  vnet_subnet_id_prod   = module.network.prod_subnet_id
  test_aks_name         = "fp11-aks-test"
  prod_aks_name         = "fp11-aks-prod"
}
 
module "app" {
  source              = "./modules/app"
  location            = var.location
  resource_group_name = module.network.resource_group_name
  acr_name            = "fp11weatheracr"
  redis_test_name     = "fp11redistest"
  redis_prod_name     = "fp11redisprod"
}