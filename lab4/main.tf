module "rg" {
  source   = "./modules/resource_group"
  rg_name  = var.rg_name
  location = var.location
}
#VNet для Task 1
module "vnet" {
  source              = "./modules/vnet"
  vnet_name           = var.vnet_name
  address_space       = var.vnet_address_space
  location            = module.rg.location
  resource_group_name   = module.rg.name
}




module "subnet_shared" {
  source              = "./modules/subnet"
  subnet_name         = "SharedServicesSubnet"
  address_prefixes    = ["10.20.10.0/24"]
  resource_group_name = module.rg.name
  vnet_name           = module.vnet.name
}

module "subnet_db" {
  source              = "./modules/subnet"
  subnet_name         = "DatabaseSubnet"
  address_prefixes    = ["10.20.20.0/24"]
  resource_group_name = module.rg.name
  vnet_name           = module.vnet.name
}



# Vnet для Task 2

module "vnet_manufacturing" {
  source              = "./modules/vnet"
  vnet_name           = "ManufacturingVnet"
  address_space       = ["10.30.0.0/16"]
  location            = module.rg.location
  resource_group_name = module.rg.name
}
module "subnet_sensor1" {
  source              = "./modules/subnet"
  subnet_name         = "SensorSubnet1"
  address_prefixes    = ["10.30.20.0/24"]
  resource_group_name = module.rg.name
  vnet_name           = module.vnet_manufacturing.name
}

module "subnet_sensor2" {
  source              = "./modules/subnet"
  subnet_name         = "SensorSubnet2"
  address_prefixes    = ["10.30.21.0/24"]
  resource_group_name = module.rg.name
  vnet_name           = module.vnet_manufacturing.name
}




#Task 3

module "asg_web" {
  source              = "./modules/asg"
  asg_name            = "asg-web"
  location            = var.location
  resource_group_name = var.rg_name
}

module "nsg_secure" {
  source              = "./modules/nsg"
  nsg_name            = "myNSGSecure"
  location            = var.location
  resource_group_name = var.rg_name
  asg_id              = module.asg_web.id
  subnet_id           = module.subnet_shared.id
}


#Task 4
module "dns_public" {
  source       = "./modules/dns_public"
  rg_name      = var.rg_name
  zone_name    = "lab4-contoso.com"
  ip_addresses = ["10.1.1.4"]
  ttl          = var.ttl
}

module "dns_private" {
  source      = "./modules/dns_private"
  rg_name     = var.rg_name
  zone_name   = "private.lab4-contoso.com"
  link_name   = "manufacturing-link"
  vnet_id     = module.vnet_manufacturing.id
  record_name = "sensorvm"
  ip_addresses= ["10.1.1.4"]
  ttl         = var.ttl
}
