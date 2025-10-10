output "vnet_id" {
  value = azurerm_virtual_network.vn.id
}

output "subnet0_id" {
  value = azurerm_subnet.sub0.id
}

output "subnet1_id" {
  value = azurerm_subnet.sub1.id
}

output "subnet2_id" {
  value = azurerm_subnet.sub2.id
}