output "resource_group_name" {
  value = module.rg.rg_name   
}

output "vnet_name" {
  value = module.network.vnet_name
}

output "subnet_id" {
  value = module.network.subnet_id
}

output "nsg_id" {
  value = module.network.nsg_id
}
output "nic_vm1_id" {
  value = module.nic_vm1.nic_id
}

output "nic_vm2_id" {
  value = module.nic_vm2.nic_id
}
output "vm1_name" {
  value = module.vm1.vm_name
}

output "vm2_name" {
  value = module.vm2.vm_name
}

output "vm1_id" {
  value = module.vm1.vm_id
}

output "vm2_id" {
  value = module.vm2.vm_id
}


output "location_primary" {
  value = var.location
}

output "location_secondary" {
  value = var.location_2
}

output "vnet_name_2" {
  value = module.network_2.vnet_name
}

output "subnet_id_2" {
  value = module.network_2.subnet_id
}

output "nsg_id_2" {
  value = module.network_2.nsg_id
}

output "nic_psvm_id" {
  value = module.nic_psvm.nic_id
}

output "nic_clivm_id" {
  value = module.nic_clivm.nic_id
}

output "myPSVM_name" {
  value = module.myPSVM.vm_name
}

output "myPSVM_id" {
  value = module.myPSVM.vm_id
}

output "myCLIVM_name" {
  value = module.myCLIVM.vm_name
}

output "myCLIVM_id" {
  value = module.myCLIVM.vm_id
}

output "vmss_id" {
  value = module.vmss1.vmss_id
}

output "vmss_name" {
  value = module.vmss1.vmss_name
}

output "lb_id" {
  value = module.lb.lb_id
}

output "lb_backend_pool_id" {
  value = module.lb.backend_pool_id
}

output "vmss_public_ip_id" {
  value = module.vmss_pip.public_ip_id
}

output "vm1_data_disk_id" {
  value = azurerm_managed_disk.vm1_disk1.id
}