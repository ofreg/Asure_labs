resource "azurerm_storage_account" "storage" {
  name                     = var.storage_name
  resource_group_name      = var.rg_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
  account_kind             = "StorageV2"
}

resource "azurerm_storage_account_network_rules" "rules" {
  storage_account_id          = azurerm_storage_account.storage.id
  default_action              = "Deny"
  bypass                      = ["AzureServices"]
  virtual_network_subnet_ids  = [var.vnet_subnet_id]
}

