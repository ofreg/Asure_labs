resource "azurerm_storage_container" "data" {
  name                  = var.container_name
  storage_account_id    = var.storage_account_id
  container_access_type = "private"
}

resource "azurerm_storage_management_policy" "retention" {
  storage_account_id = var.storage_account_id
  rule {
    name    = "retentionpolicy"
    enabled = true
    filters {
      blob_types = ["blockBlob"]
    }
    actions {
      base_blob {
        delete_after_days_since_modification_greater_than = 180
      }
    }
  }
}

resource "azurerm_storage_blob" "test" {
  name                   = "${var.container_name}/${var.blob_name}"
  storage_account_name   = var.storage_account_name
  storage_container_name = azurerm_storage_container.data.name
  type                   = "Block"
  access_tier            = "Hot"
  source                 = "${path.root}/files/${var.blob_name}"
}

data "azurerm_storage_account_sas" "sas" {
  connection_string = var.connection_string
  https_only        = true
  start             = timeadd(timestamp(), "-24h")
  expiry            = timeadd(timestamp(), "24h")

  permissions {
    add     = false
    create  = false
    delete  = false
    filter  = false
    list    = true
    process = false
    read    = true
    tag     = false
    update  = false
    write   = false
  }

  resource_types {
    service   = true
    container = true
    object    = true
  }

  services {
    blob  = true
    file  = false
    queue = false
    table = false
  }
}

