output "appgw_id" {
  value = azurerm_application_gateway.appgw.id
}

output "frontend_ip" {
  value = azurerm_public_ip.appgw_ip.ip_address
}

output "appgw_subnet_id" {
  value = azurerm_subnet.appgw_subnet.id
}
