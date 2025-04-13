resource "azurerm_kubernetes_cluster" "test" {
  name                = var.test_aks_name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = "${var.test_aks_name}-dns"

  default_node_pool {
    name           = "default"
    node_count     = 1
    vm_size        = "Standard_B2s"
    vnet_subnet_id = var.vnet_subnet_id_test
    type           = "VirtualMachineScaleSets"
  }

  identity {
    type = "SystemAssigned"
  }

  kubernetes_version = "1.32.0"

  role_based_access_control {
    enabled = true
  }

  network_profile {
    network_plugin = "azure"
    network_policy = "azure"
  }

  api_server_access_profile {
    authorized_ip_ranges = ["0.0.0.0/0"]
  }

  tags = {
    environment = "test"
  }
}

resource "azurerm_kubernetes_cluster" "prod" {
  name                = var.prod_aks_name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = "${var.prod_aks_name}-dns"

  default_node_pool {
    name                = "default"
    min_count           = 1
    max_count           = 3
    enable_auto_scaling = true
    vm_size             = "Standard_B2s"
    vnet_subnet_id      = var.vnet_subnet_id_prod
    type                = "VirtualMachineScaleSets"
  }

  identity {
    type = "SystemAssigned"
  }

  kubernetes_version = "1.32.0"

  role_based_access_control {
    enabled = true
  }

  network_profile {
    network_plugin = "azure"
    network_policy = "azure"
  }

  api_server_access_profile {
    authorized_ip_ranges = ["<your-ip>/32"] # Replace with your actual IP
  }

  tags = {
    environment = "prod"
  }
}