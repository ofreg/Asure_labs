module "rg" {
  source   = "./modules/rg"
  rg_name  =  var.rg_name
  location =  var.location
}

module "network" {
  source   = "./modules/network"
  location = var.location
  rg_name  = module.rg.rg_name   
}
module "nic_vm1" {
  source     = "./modules/nic"
  nic_name   = "az104-nic1"
  location   = var.location
  rg_name  = module.rg.rg_name   
  subnet_id  = module.network.subnet_id
  nsg_id     = module.network.nsg_id
}

module "nic_vm2" {
  source     = "./modules/nic"
  nic_name   = "az104-nic2"
  location   = var.location
  rg_name  = module.rg.rg_name   
  subnet_id  = module.network.subnet_id
  nsg_id     = module.network.nsg_id
}
module "vm1" {
  source            = "./modules/vm"
  vm_name           = "az104-vm1"
  location          = var.location
  rg_name  = module.rg.rg_name   
  vm_size           = "Standard_D2s_v3"
  admin_username    = var.admin_username
  admin_password    = var.admin_password
  nic_id            = module.nic_vm1.nic_id
  availability_zone = "1"
}

module "vm2" {
  source            = "./modules/vm"
  vm_name           = "az104-vm2"
  location          = var.location
  rg_name  = module.rg.rg_name   
  vm_size           = "Standard_D2s_v3"
  admin_username    = var.admin_username
  admin_password    = var.admin_password
  nic_id            = module.nic_vm2.nic_id
  availability_zone = "2"
}
