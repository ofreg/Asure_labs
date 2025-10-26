module "rg" {
  source   = "./modules/rg"
  rg_name  = var.rg_name
  location = var.location
}

module "app_service_plan" {
  source   = "./modules/asp"
  name     = "${var.webapp_name}-asp"
  location = var.location
  rg_name  = module.rg.rg_name
  tier     = var.appservice_tier
  sku      = var.appservice_sku
  capacity = var.appservice_capacity
}

module "web_app" {
  source          = "./modules/web_app"
  name            = var.webapp_name
  location        = var.location
  rg_name         = module.rg.rg_name
  service_plan_id = module.app_service_plan.asp_id
  app_settings    = { "WEBSITE_RUN_FROM_PACKAGE" = "1" }
  repo_url        = "https://github.com/Azure-Samples/php-docs-hello-world"
  branch          = "master"
  github_token    = var.github_token
}

module "web_app_slot" {
  source           = "./modules/web_app_slot"
  slot_name        = "staging"
  app_service_id   = module.web_app.webapp_id
  app_settings     = { "WEBSITE_RUN_FROM_PACKAGE" = "1" }
  repo_url         = "https://github.com/Azure-Samples/php-docs-hello-world"
  branch           = "master"
  github_token    = var.github_token
}


module "web_app_autoscale" {
  source               = "./modules/web_app_autoscale"
  name                 = "${var.webapp_name}-autoscale"
  location             = var.location
  resource_group_name  = module.rg.rg_name
  app_service_plan_id  = module.app_service_plan.asp_id
  min_capacity         = 1
  max_capacity         = 2
  default_capacity     = 1
  scale_up_threshold   = 70
  scale_down_threshold = 30
}
