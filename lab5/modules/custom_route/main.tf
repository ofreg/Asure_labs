resource "azurerm_subnet" "perimeter" {
  name                 = var.subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.vnet_name
  address_prefixes     = [var.subnet_prefix]
}

resource "azurerm_route_table" "rt_core" {
  name                          = var.route_table_name
  location                      = var.location
  resource_group_name           = var.resource_group_name
}

resource "azurerm_route" "perimeter_to_core" {
  name                   = var.route_name
  resource_group_name    = var.resource_group_name
  route_table_name       = azurerm_route_table.rt_core.name
  address_prefix         = var.destination_address
  next_hop_type          = "VirtualAppliance"
  next_hop_in_ip_address = var.next_hop_ip
}

resource "azurerm_subnet_route_table_association" "core_association" {
  subnet_id      = var.core_subnet_id
  route_table_id = azurerm_route_table.rt_core.id
}
