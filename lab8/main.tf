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
  rg_name           = module.rg.rg_name
  vm_size           = "Standard_B1ls"
  admin_username    = var.admin_username
  admin_password    = var.admin_password
  nic_id            = module.nic_vm1.nic_id
  availability_zone = "1"
}

resource "azurerm_managed_disk" "vm1_disk1" {
  name                = "vm1-disk1"
  location            = var.location
  resource_group_name = module.rg.rg_name
  create_option       = "Empty"
  storage_account_type = "StandardSSD_LRS"
  disk_size_gb        = 32
  zone                 = "1"
}
resource "azurerm_virtual_machine_data_disk_attachment" "vm1_disk1_attach" {
  managed_disk_id    = azurerm_managed_disk.vm1_disk1.id
  virtual_machine_id = module.vm1.vm_id
  lun                = 0
  caching            = "ReadWrite"
}
module "vm2" {
  source            = "./modules/vm"
  vm_name           = "az104-vm2"
  location          = var.location
  rg_name  = module.rg.rg_name   
  vm_size           = "Standard_B1ls"
  admin_username    = var.admin_username
  admin_password    = var.admin_password
  nic_id            = module.nic_vm2.nic_id
  availability_zone = "2"
}


module "vmss_pip" {
  source   = "./modules/public_ip"
  name     = "vmss-pip"
  location = var.location
  rg_name  = module.rg.rg_name
}

module "lb" {
  source       = "./modules/lb"
  name         = "vmss-lb"
  location     = var.location
  rg_name      = module.rg.rg_name
  public_ip_id = module.vmss_pip.public_ip_id
}


module "vmss1" {
  source            = "./modules/vmss"
  vmss_name         = "vmss1"
  location          = var.location
  rg_name           = module.rg.rg_name
  vm_size           = "Standard_B1ls"
  admin_username    = var.admin_username
  admin_password    = var.admin_password
  subnet_id         = module.network.subnet_id
  lb_backend_pool_id = module.lb.backend_pool_id
  availability_zones = ["1","2","3"]
  instance_count     = 2
}