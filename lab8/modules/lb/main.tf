resource "azurerm_lb" "vmss_lb" {
  name                = var.name
  location            = var.location
  resource_group_name = var.rg_name
  sku                 = "Standard"

  frontend_ip_configuration {
    name                 = "publicIP"
    public_ip_address_id = var.public_ip_id
  }
}

resource "azurerm_lb_backend_address_pool" "vmss_be" {
  name                = "vmss-be"
  loadbalancer_id     = azurerm_lb.vmss_lb.id
}