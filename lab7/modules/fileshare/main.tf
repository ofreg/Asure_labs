resource "azurerm_storage_share" "share" {
  name                 = var.share_name
  storage_account_name = var.storage_account_name
  quota                = 50
}

resource "azurerm_storage_share_file" "file" {
  name             = basename(var.file_path)
  storage_share_id = azurerm_storage_share.share.id
  source           = "${path.root}/${var.file_path}"
}
