module "rg" {
  source   = "./modules/resource_group"
  rg_name  = var.rg_name
  location = var.location
}

module "disk1" {
  source        = "./modules/disk"
  rg_name       = module.rg.name
  location      = module.rg.location
  disk_name     = "az104-disk1"
  disk_size_gb  = var.disk_size_gb
  storage_type  = var.storage_type
}
module "disk2" {
  source        = "./modules/disk"
  rg_name       = module.rg.name
  location      = module.rg.location
  disk_name     = "az104-disk2"
  disk_size_gb  = var.disk_size_gb
  storage_type  = var.storage_type
}
module "disk3" {
  source        = "./modules/disk"
  rg_name       = module.rg.name
  location      = module.rg.location
  disk_name     = "az104-disk3"
  disk_size_gb  = var.disk_size_gb
  storage_type  = var.storage_type
}
module "disk4" {
  source        = "./modules/disk"
  rg_name       = module.rg.name
  location      = module.rg.location
  disk_name     = "az104-disk4"
  disk_size_gb  = var.disk_size_gb
  storage_type  = var.storage_type
}
module "disk5" {
  source        = "./modules/disk"
  rg_name       = module.rg.name
  location      = module.rg.location
  disk_name     = "az104-disk5"
  disk_size_gb  = var.disk_size_gb
  storage_type  = var.storage_type
}