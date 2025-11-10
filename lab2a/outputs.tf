output "management_group_id" {
  value       = module.management_group.management_group_id
}

output "helpdesk_group_id" {
  value       = module.helpdesk_group.group_object_id
}

output "vm_contributor_assignment_id" {
  value       = module.vm_contributor_role.role_assignment_id
}

output "custom_support_assignment_id" {
  value       = module.custom_support_role.role_assignment_id
}
