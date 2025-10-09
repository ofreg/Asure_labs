output "core_to_manufacturing_peering_id" {
  value = azurerm_virtual_network_peering.peer_core_to_manufacturing.id
}

output "manufacturing_to_core_peering_id" {
  value = azurerm_virtual_network_peering.peer_manufacturing_to_core.id
}
