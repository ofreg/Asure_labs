output "container_name" {
  value = azurerm_storage_container.data.name
}

output "blob_name" {
  value = azurerm_storage_blob.test.name
}

output "sas_token" {
  value = data.azurerm_storage_account_sas.sas.sas
}
