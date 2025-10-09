#Task 0
module "rg" {
  source   = "./modules/resource_group"
  rg_name  = var.rg_name
  location = var.location
}
#Task 1 - Core Services
module "vnet" {
  source         = "./modules/vnet"
  vnet_name      = "CoreServicesVnet"
  address_space  = ["10.0.0.0/16"]
  location       = module.rg.rg_location
  resource_group = module.rg.rg_name
}

module "subnet" {
  source              = "./modules/subnet"
  subnet_name         = "Core"
  subnet_prefix       = "10.0.0.0/24"
  resource_group_name = module.rg.rg_name
  vnet_name           = module.vnet.vnet_name
}

module "vm" {
  source             = "./modules/vm"
  vm_name            = "CoreServicesVM"
  resource_group     = module.rg.rg_name
  location           = module.rg.rg_location
  subnet_id          = module.subnet.subnet_id
  admin_username     = var.admin_username
  admin_password     = var.admin_password
  vm_size            = "Standard_B2s"
  image_offer        = "WindowsServer"
  image_publisher    = "MicrosoftWindowsServer"
  image_sku          = "2019-Datacenter"
  image_version      = "latest"
}






#Task 2 - Core Services
module "m_vnet" {
  source         = "./modules/vnet"
  vnet_name      = "ManufacturingVnet"
  address_space  = ["172.16.0.0/16"]
  location       = module.rg.rg_location
  resource_group = module.rg.rg_name
}

module "m_subnet" {
  source              = "./modules/subnet"
  subnet_name         = "Manufacturing"
  subnet_prefix       = "172.16.0.0/24"
  resource_group_name = module.rg.rg_name
  vnet_name           = module.m_vnet.vnet_name
}

module "m_vm" {
  source             = "./modules/vm"
  vm_name            = "ManufacturingVM"
  resource_group     = module.rg.rg_name
  location           = module.rg.rg_location
  subnet_id          = module.m_subnet.subnet_id
  admin_username     = var.admin_username
  admin_password     = var.admin_password
  vm_size            = "Standard_B2s"
  image_offer        = "WindowsServer"
  image_publisher    = "MicrosoftWindowsServer"
  image_sku          = "2019-Datacenter"
  image_version      = "latest"
}



#Task 3

module "network_watcher" {
  source              = "./modules/network_watcher"
  name                = var.network_watcher_name
  location            = var.location
  resource_group_name = module.rg.rg_name
}

#Task 4 - VNet Peering
module "vnet_peering" {
  source                  = "./modules/vnet_peering"
  vnet_name               = module.vnet.vnet_name
  vnet_id                 = module.vnet.vnet_id
  peer_vnet_name          = module.m_vnet.vnet_name
  peer_vnet_id            = module.m_vnet.vnet_id
  resource_group          = module.rg.rg_name
  peer_vnet_resource_group = module.rg.rg_name
}


#Task 6
module "custom_route" {
  source                = "./modules/custom_route"
  subnet_name           = "perimeter"
  subnet_prefix         = "10.0.1.0/24"
  vnet_name             = module.vnet.vnet_name
  resource_group_name   = module.rg.rg_name
  location              = module.rg.rg_location
  route_table_name      = "rt-CoreServices"
  route_name            = "PerimetertoCore"
  destination_address   = "10.0.0.0/16"
  next_hop_ip           = "10.0.1.7"
  core_subnet_id        = module.subnet.subnet_id
}