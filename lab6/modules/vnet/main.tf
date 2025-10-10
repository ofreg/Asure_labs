resource "azurerm_virtual_network" "vn" {
  name                = "az104-06-vnet1"
  location            = var.location
  resource_group_name = var.rg_name
  address_space       = ["10.60.0.0/22"]
}

resource "azurerm_subnet" "sub0" {
  name                 = "subnet0"
  resource_group_name  = var.rg_name
  virtual_network_name = azurerm_virtual_network.vn.name
  address_prefixes     = ["10.60.0.0/24"]
}

resource "azurerm_subnet" "sub1" {
  name                 = "subnet1"
  resource_group_name  = var.rg_name
  virtual_network_name = azurerm_virtual_network.vn.name
  address_prefixes     = ["10.60.1.0/24"]
}

resource "azurerm_subnet" "sub2" {
  name                 = "subnet2"
  resource_group_name  = var.rg_name
  virtual_network_name = azurerm_virtual_network.vn.name
  address_prefixes     = ["10.60.2.0/24"]
}

