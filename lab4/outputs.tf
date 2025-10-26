output "resource_group_name" {
  value = module.rg.name
}

#output "vnet_name" {
#  value = module.vnet.name
#}

#output "shared_subnet_id" {
#  value = module.subnet_shared.id
#}

#output "db_subnet_id" {
#  value = module.subnet_db.id
#}



# Task 2
output "manufacturing_vnet_name" {
  value = module.vnet_manufacturing.name
}

output "sensor_subnet1_name" {
  value = basename(module.subnet_sensor1.id)
}

output "sensor_subnet2_name" {
  value = module.subnet_sensor2.name
}

output "asg_web_name" {
  value = module.asg_web.name
}


output "nsg_secure_name" {
  value = basename(module.nsg_secure.id)
}

output "public_www_record" {
  value = module.dns_public.www_record
}

output "public_dns_zone_name" {
  value = module.dns_public.zone_name
}

output "private_dns_zone_name" {
  value = module.dns_private.private_zone_name
}

output "private_sensor_record" {
  value = module.dns_private.sensor_record
}