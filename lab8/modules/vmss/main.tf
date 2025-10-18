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
