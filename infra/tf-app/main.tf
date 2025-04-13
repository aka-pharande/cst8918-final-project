module "network" {
  source   = "./modules/network"
  location = var.location
}

# defsec:ignore:azure-container-logging
# OMS Agent is deprecated and not required per assignment instructions. 
# Logging via Diagnostic Settings can be added if needed, but is omitted to reduce Azure costs.

# defsec:ignore:azure-container-limit-authorized-ips
# This is a false positive — we have already configured authorized IP ranges using api_server_access_profile.
module "aks" {
  source              = "./modules/aks"
  location            = var.location
  resource_group_name = module.network.resource_group_name
  vnet_subnet_id_test = module.network.test_subnet_id
  vnet_subnet_id_prod = module.network.prod_subnet_id
  test_aks_name       = "fp11-aks-test"
  prod_aks_name       = "fp11-aks-prod"
}

module "acr" {
  source              = "./modules/acr"
  location            = var.location
  resource_group_name = module.network.resource_group_name
  acr_name            = "fp11weatheracr"
  redis_test_name     = "fp11redistest"
  redis_prod_name     = "fp11redisprod"
}