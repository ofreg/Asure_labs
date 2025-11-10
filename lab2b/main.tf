module "lab_rg" {
  source   = "./modules/resource_group"
  rg_name  = "az104-rg2"
  location = "East US"
}

module "policy" {
  source = "./modules/policy"
  rg_id  = module.lab_rg.rg_id
}

module "locks" {
  source = "./modules/locks"
  rg_id  = module.lab_rg.rg_id
}