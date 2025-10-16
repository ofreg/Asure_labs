resource "azurerm_virtual_machine_scale_set" "vmss1" {
  name                = var.vmss_name
  location            = var.location
  resource_group_name = var.rg_name
  overprovision       = true
  upgrade_policy_mode  = "Manual"
  zones               = var.availability_zones

  sku {
    name     = var.vm_size       # наприклад "Standard_D2s_v3"
    capacity = var.instance_count
    tier     = "Standard"
  }

  network_profile {
    name    = "vmss-network"
    primary = true

    ip_configuration {
      name                                   = "ipconfig1"
      subnet_id                              = var.subnet_id
      load_balancer_backend_address_pool_ids = [var.lb_backend_pool_id]
      primary                                = true

      public_ip_address_configuration {
        name              = "vmss-pip"
        idle_timeout      = 10
        domain_name_label = "vmss1label" # унікальний піддомен
      }
    }
  }

  os_profile {
    computer_name_prefix = "vmss1"
    admin_username       = var.admin_username
    admin_password       = var.admin_password
  }

  os_profile_windows_config {
    provision_vm_agent = true
  }

  storage_profile_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2019-Datacenter-Gen2"
    version   = "latest"
  }

  storage_profile_os_disk {
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
}
