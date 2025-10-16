output "lb_id" {
  value = azurerm_lb.vmss_lb.id
}

output "backend_pool_id" {
  value = azurerm_lb_backend_address_pool.vmss_be.id
}
