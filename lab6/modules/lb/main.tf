resource "azurerm_public_ip" "lb_ip" {
  name                = "az104-lb-pip"
  location            = var.location
  resource_group_name = var.rg_name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_lb" "lb" {
  name                = "az104-lb"
  location            = var.location
  resource_group_name = var.rg_name
  sku                 = "Standard"
  frontend_ip_configuration {
    name                 = "az104-fe"
    public_ip_address_id = azurerm_public_ip.lb_ip.id
  }
}

resource "azurerm_lb_backend_address_pool" "bepool" {
  name                = "az104-be"
  loadbalancer_id     = azurerm_lb.lb.id
}

resource "azurerm_lb_probe" "lbprobe" {
  name                = "az104-hp"
  loadbalancer_id     = azurerm_lb.lb.id
  protocol            = "Tcp"
  port                = 80
  interval_in_seconds = 5
  number_of_probes    = 2
}

resource "azurerm_lb_rule" "lbrule" {
  name                           = "az104-lbrule"
  loadbalancer_id                = azurerm_lb.lb.id
  frontend_ip_configuration_name = azurerm_lb.lb.frontend_ip_configuration[0].name
  backend_address_pool_ids       = [azurerm_lb_backend_address_pool.bepool.id]
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  probe_id                       = azurerm_lb_probe.lbprobe.id
  idle_timeout_in_minutes        = 4
  floating_ip_enabled             = false
}
resource "azurerm_network_interface_backend_address_pool_association" "nic_assoc" {
  count                   = length(var.nic_ids)
  network_interface_id    = var.nic_ids[count.index]
  ip_configuration_name   = "ipconfig"
  backend_address_pool_id = azurerm_lb_backend_address_pool.bepool.id
}

