
resource "azurerm_virtual_network" "vn" {
  name                = var.vnet_name
  location            = var.location
  resource_group_name = var.rg_name
  address_space       = ["10.82.0.0/20"]
}

resource "azurerm_subnet" "subnet" {
  name                 = var.subnet_name
  resource_group_name  = var.rg_name
  virtual_network_name = azurerm_virtual_network.vn.name
  address_prefixes     = ["10.82.0.0/24"]
}

resource "azurerm_network_security_group" "nsg" {
  name                = var.nsg_name
  location            = var.location
  resource_group_name = var.rg_name
}
