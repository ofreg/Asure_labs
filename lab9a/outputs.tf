output "resource_group_name" {
  value = module.rg.rg_name
}
output "app_service_plan_id" {
  value = module.app_service_plan.asp_id
}
output "web_app_url" {
  value = "https://${module.web_app.default_hostname}"
}
output "staging_slot_id" {
  value = module.web_app_slot.slot_id
}
