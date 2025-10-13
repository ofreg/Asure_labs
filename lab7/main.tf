module "rg" {
  source   = "./modules/rg"
  rg_name  = var.rg_name
  location = var.location
}

module "storage" {
  source        = "./modules/storage"
  storage_name  = var.storage_name
  rg_name       = module.rg.rg_name
  location      = module.rg.rg_location
  vnet_subnet_id = module.vnet.subnet_id
}

module "blob" {
  source               = "./modules/blob"
  storage_account_id   = module.storage.storage_account_id
  storage_account_name = module.storage.storage_account_name
  connection_string    = module.storage.connection_string
  container_name       = "securitytest"
  blob_name            = "test.txt"
}

module "fileshare" {
  source              = "./modules/fileshare"
  storage_account_name = module.storage.storage_name
  resource_group_name  = module.rg.rg_name
  share_name           = var.share_name
  file_path            = var.file_path
}
module "vnet" {
  source   = "./modules/vnet"
  rg_name  = module.rg.rg_name
  location = module.rg.rg_location
  vnet_name = var.vnet_name
  subnet_name = var.subnet_name
}