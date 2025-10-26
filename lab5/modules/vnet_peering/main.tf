resource "azurerm_virtual_network_peering" "peer_core_to_manufacturing" {
  name                      = "${var.vnet_name}-to-${var.peer_vnet_name}"
  resource_group_name       = var.resource_group
  virtual_network_name      = var.vnet_name
  remote_virtual_network_id = var.peer_vnet_id

  allow_forwarded_traffic      = true
  allow_virtual_network_access = true
  use_remote_gateways          = false
}

resource "azurerm_virtual_network_peering" "peer_manufacturing_to_core" {
  name                      = "${var.peer_vnet_name}-to-${var.vnet_name}"
  resource_group_name       = var.peer_vnet_resource_group
  virtual_network_name      = var.peer_vnet_name
  remote_virtual_network_id = var.vnet_id

  allow_forwarded_traffic      = true
  allow_virtual_network_access = true
  use_remote_gateways          = false
}
