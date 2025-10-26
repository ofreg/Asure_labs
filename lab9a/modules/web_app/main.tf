resource "azurerm_linux_web_app" "web" {
  name                = var.name
  location            = var.location
  resource_group_name = var.rg_name
  service_plan_id     = var.service_plan_id

  site_config {
    application_stack {
      php_version = "8.2"
    }
  }

  app_settings = var.app_settings
}

