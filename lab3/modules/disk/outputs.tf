output "disk_name" {
  value = azurerm_managed_disk.disk.name
}

output "disk_size_gb" {
  value = azurerm_managed_disk.disk.disk_size_gb
}

output "storage_type" {
  value = azurerm_managed_disk.disk.storage_account_type
}