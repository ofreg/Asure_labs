output "rg_name" {
  value = module.rg.rg_name
}

output "rg_location" {
  value = module.rg.rg_location
}

output "vnet_name" {
  value = module.vnet.vnet_name
}

output "vnet_id" {
  value = module.vnet.vnet_id
}

output "subnet_name" {
  value = module.subnet.subnet_name
}

output "core_subnet_id" {
  value = module.subnet.subnet_id
}

output "vm_public_ip" {
  value = module.vm.public_ip
}

output "vm_private_ip" {
  value = module.vm.private_ip
}

output "manufacturing_vm_id" {
  value = module.m_vm.vm_id
}

output "manufacturing_vm_private_ip" {
  value = module.m_vm.private_ip
}

output "perimeter_subnet_id" {
  value = module.custom_route.perimeter_subnet_id
}

output "route_table_id" {
  value = module.custom_route.route_table_id
}

output "route_id" {
  value = module.custom_route.route_id
}


output "core_to_manufacturing_peering_id" {
  value = module.vnet_peering.core_to_manufacturing_peering_id
}

output "manufacturing_to_core_peering_id" {
  value = module.vnet_peering.manufacturing_to_core_peering_id
}
