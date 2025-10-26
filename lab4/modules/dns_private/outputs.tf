output "private_zone_name" {
  value = azurerm_private_dns_zone.private_dns.name
}

output "sensor_record" {
  value = azurerm_private_dns_a_record.sensorvm.fqdn
}
