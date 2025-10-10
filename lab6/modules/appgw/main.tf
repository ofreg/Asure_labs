resource "azurerm_subnet" "appgw_subnet" {
  name                 = "subnet-appgw"
  resource_group_name  = var.rg_name
  virtual_network_name = var.vnet_name
  address_prefixes     = ["10.60.3.224/27"]
}

resource "azurerm_public_ip" "appgw_ip" {
  name                = "az104-gwpip"
  location            = var.location
  resource_group_name = var.rg_name
  allocation_method   = "Static"
  sku                 = "Standard"
  zones               = ["1"]
}

resource "azurerm_application_gateway" "appgw" {
  name                = "az104-appgw"
  location            = var.location
  resource_group_name = var.rg_name

  sku {
    name     = "Standard_v2"
    tier     = "Standard_v2"
    capacity = 2
  }

  gateway_ip_configuration {
    name      = "appgw-ipcfg"
    subnet_id = azurerm_subnet.appgw_subnet.id
  }

  frontend_ip_configuration {
    name                 = "az104-gwfe"
    public_ip_address_id = azurerm_public_ip.appgw_ip.id
  }

  frontend_port {
    name = "http-port"
    port = 80
  }

  backend_address_pool {
    name = "az104-appgwbe"
  }

  backend_address_pool {
    name = "az104-imagebe"
  }

  backend_address_pool {
    name = "az104-videobe"
  }

  backend_http_settings {
    name                  = "default-http-settings"
    cookie_based_affinity = "Disabled"
    port                  = 80
    protocol              = "Http"
    request_timeout       = 20
  }

  http_listener {
    name                           = "az104-listener"
    frontend_ip_configuration_name = "az104-gwfe"
    frontend_port_name             = "http-port"
    protocol                       = "Http"
  }

  url_path_map {
    name                              = "az104-pathmap"
    default_backend_address_pool_name  = "az104-appgwbe"
    default_backend_http_settings_name = "default-http-settings"

    path_rule {
      name                       = "images"
      paths                      = ["/image/*"]
      backend_address_pool_name  = "az104-imagebe"
      backend_http_settings_name = "default-http-settings"
    }

    path_rule {
      name                       = "videos"
      paths                      = ["/video/*"]
      backend_address_pool_name  = "az104-videobe"
      backend_http_settings_name = "default-http-settings"
    }
  }

  request_routing_rule {
    name               = "az104-gwrule"
    rule_type          = "PathBasedRouting"
    http_listener_name = "az104-listener"
    url_path_map_name  = "az104-pathmap"
    priority           = 10
  }
}