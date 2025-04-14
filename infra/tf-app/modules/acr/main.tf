resource "azurerm_container_registry" "weather_app_acr" {

  name = var.acr_name

  resource_group_name = var.resource_group_name

  location = var.location

  sku = "Basic"

  admin_enabled = true

}

resource "azurerm_redis_cache" "redis_test" {

  name = var.redis_test_name

  location = var.location

  resource_group_name = var.resource_group_name

  capacity = 1

  family = "C"

  sku_name = "Basic"

  non_ssl_port_enabled = true

}

resource "azurerm_redis_cache" "redis_prod" {

  name = var.redis_prod_name

  location = var.location

  resource_group_name = var.resource_group_name

  capacity = 1

  family = "C"

  sku_name = "Basic"

  non_ssl_port_enabled = true



}

 