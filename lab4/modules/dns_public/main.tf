resource "azurerm_dns_zone" "public_dns" {
  name                = var.zone_name
  resource_group_name = var.rg_name
}

resource "azurerm_dns_a_record" "www" {
  name                = "www"
  zone_name           = azurerm_dns_zone.public_dns.name
  resource_group_name = var.rg_name
  ttl                 = var.ttl
  records             = var.ip_addresses
}
