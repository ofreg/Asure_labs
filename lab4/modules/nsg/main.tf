resource "azurerm_network_security_group" "nsg" {
  name                = var.nsg_name
  location            = var.location
  resource_group_name = var.resource_group_name
}


resource "azurerm_network_security_rule" "allow_asg" {
  name                        = "AllowASG"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range            = "*"
  destination_port_ranges      = ["80", "443"]
  source_application_security_group_ids = [var.asg_id]
  destination_address_prefix   = "*"
  resource_group_name          = var.resource_group_name
  network_security_group_name  = azurerm_network_security_group.nsg.name
}


resource "azurerm_network_security_rule" "deny_internet" {
  name                        = "DenyInternetOutbound"
  priority                    = 4096
  direction                   = "Outbound"
  access                      = "Deny"
  protocol                    = "*"
  source_port_range            = "*"
  destination_port_range       = "*"
  source_address_prefix        = "*"
  destination_address_prefix   = "Internet"
  resource_group_name          = var.resource_group_name
  network_security_group_name  = azurerm_network_security_group.nsg.name
}

resource "azurerm_subnet_network_security_group_association" "nsg_assoc" {
  subnet_id                 = var.subnet_id
  network_security_group_id = azurerm_network_security_group.nsg.id
}
