output "zone_name" {
  value = azurerm_dns_zone.public_dns.name
}

output "www_record" {
  value = azurerm_dns_a_record.www.fqdn
}
