output "rg_name" {
  value = module.rg.rg_name
}

output "storage_name" {
  value = module.storage.storage_name
}

output "storage_primary_location" {
  value = module.storage.storage_primary_location
}

output "storage_secondary_location" {
  value = module.storage.storage_secondary_location
}
output "blob_name" {
  value = module.blob.blob_name
}

output "sas_token" {
  value = module.blob.sas_token
  sensitive  = true
}
output "vnet_name" {
  value = module.vnet.vnet_name
}

output "share_name" {
  value = module.fileshare.share_name
}