resource "azurerm_private_dns_zone" "private_dns" {
  name                = var.zone_name
  resource_group_name = var.rg_name
}

resource "azurerm_private_dns_zone_virtual_network_link" "link" {
  name                  = var.link_name
  resource_group_name   = var.rg_name
  private_dns_zone_name = azurerm_private_dns_zone.private_dns.name
  virtual_network_id    = var.vnet_id
  registration_enabled  = true
}

resource "azurerm_private_dns_a_record" "sensorvm" {
  name                = var.record_name
  zone_name           = azurerm_private_dns_zone.private_dns.name
  resource_group_name = var.rg_name
  ttl                 = var.ttl
  records             = var.ip_addresses
}
