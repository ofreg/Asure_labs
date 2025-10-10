#Task 0
module "rg" {
  source   = "./modules/rg"
  rg_name  = var.rg_name
  location = var.location
}
#Task 1
module "vnet" {
  source     = "./modules/vnet"
  rg_name    = module.rg.rg_name
  location   = var.location
}

module "nsg" {
  source   = "./modules/nsg"
  rg_name  = module.rg.rg_name
  location = var.location
}

module "nic0" {
  source    = "./modules/nic"
  rg_name   = module.rg.rg_name
  location  = var.location
  subnet_id = module.vnet.subnet0_id
  nsg_id    = module.nsg.nsg_id
  nic_name  = "nic0"
}

module "nic1" {
  source    = "./modules/nic"
  rg_name   = module.rg.rg_name
  location  = var.location
  subnet_id = module.vnet.subnet1_id
  nsg_id    = module.nsg.nsg_id
  nic_name  = "nic1"
}

module "nic2" {
  source    = "./modules/nic"
  rg_name   = module.rg.rg_name
  location  = var.location
  subnet_id = module.vnet.subnet2_id
  nsg_id    = module.nsg.nsg_id
  nic_name  = "nic2"
}

module "vm0" {
  source     = "./modules/vm"
  rg_name    = module.rg.rg_name
  location   = var.location
  vm_name    = "vm0"
  vm_size    = var.vm_size
  admin_user = "localadmin"
  admin_pass = var.admin_password
  nic_id     = module.nic0.nic_id
}

module "vm1" {
  source     = "./modules/vm"
  rg_name    = module.rg.rg_name
  location   = var.location
  vm_name    = "vm1"
  vm_size    = var.vm_size
  admin_user = "localadmin"
  admin_pass = var.admin_password
  nic_id     = module.nic1.nic_id
}

module "vm2" {
  source     = "./modules/vm"
  rg_name    = module.rg.rg_name
  location   = var.location
  vm_name    = "vm2"
  vm_size    = var.vm_size
  admin_user = "localadmin"
  admin_pass = var.admin_password
  nic_id     = module.nic2.nic_id
}

#Task 2
module "lb" {
  source    = "./modules/lb"
  rg_name   = module.rg.rg_name
  location  = var.location
  nic_ids   = [module.nic0.nic_id, module.nic1.nic_id]
}
