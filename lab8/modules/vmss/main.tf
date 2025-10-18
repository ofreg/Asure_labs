  resource "azurerm_windows_virtual_machine_scale_set" "vmss1" {
    name                = var.vmss_name
    location            = var.location
    resource_group_name = var.rg_name
    zones               = var.availability_zones
    overprovision       = true
    admin_username      = var.admin_username
    admin_password      = var.admin_password
    instances           = var.instance_count
    sku                 = var.vm_size

    source_image_reference {
      publisher = "MicrosoftWindowsServer"
      offer     = "windowsserver-gen2preview"
      sku       = "2019-datacenter-gen2"
      version   = "2019.0.20190620"
    }

    os_disk {
      caching              = "ReadWrite"
      storage_account_type = "Standard_LRS"
    }

    network_interface {
      name    = "nic"
      primary = true
      ip_configuration {
        name                                   = "ipconfig1"
        subnet_id                              = var.subnet_id
        load_balancer_backend_address_pool_ids = [var.lb_backend_pool_id]
      }
    }
  }
resource "azurerm_monitor_autoscale_setting" "vmss_autoscale" {
  name                = "${var.vmss_name}-autoscale"
  location            = var.location
  resource_group_name = var.rg_name
  target_resource_id  = azurerm_windows_virtual_machine_scale_set.vmss1.id

  profile {
    name = "autoscale-profile"

    capacity {
      minimum = "2"
      maximum = "10"
      default = "2"
    }

    rule {
      metric_trigger {
        metric_name        = "Percentage CPU"
        metric_resource_id = azurerm_windows_virtual_machine_scale_set.vmss1.id
        time_grain         = "PT1M"
        statistic          = "Average"
        time_window        = "PT10M"
        time_aggregation   = "Average"
        operator           = "GreaterThan"
        threshold          = 70
      }

      scale_action {
        direction = "Increase"
        type      = "PercentChangeCount"
        value     = "50"
        cooldown  = "PT5M"
      }
    }

    rule {
      metric_trigger {
        metric_name        = "Percentage CPU"
        metric_resource_id = azurerm_windows_virtual_machine_scale_set.vmss1.id
        time_grain         = "PT1M"
        statistic          = "Average"
        time_window        = "PT10M"
        time_aggregation   = "Average"
        operator           = "LessThan"
        threshold          = 30
      }

      scale_action {
        direction = "Decrease"
        type      = "PercentChangeCount"
        value     = "20"
        cooldown  = "PT5M"
      }
    }
  }


}
