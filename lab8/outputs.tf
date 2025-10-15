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
