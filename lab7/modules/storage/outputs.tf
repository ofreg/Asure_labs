output "storage_name" {
  value = azurerm_storage_account.storage.name
}

output "storage_primary_location" {
  value = azurerm_storage_account.storage.primary_location
}

output "storage_secondary_location" {
  value = azurerm_storage_account.storage.secondary_location
}

output "storage_account_id" {
  value = azurerm_storage_account.storage.id
}

output "connection_string" {
  value = azurerm_storage_account.storage.primary_connection_string
}
output "storage_account_name" {
  value = azurerm_storage_account.storage.name
}
