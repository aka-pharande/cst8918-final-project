output "test_kube_config" {
  value     = azurerm_kubernetes_cluster.test.kube_config_raw
  sensitive = true
}

output "prod_kube_config" {
  value     = azurerm_kubernetes_cluster.prod.kube_config_raw
  sensitive = true
}