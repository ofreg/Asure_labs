output "policy_assignment_id" {
  value = azapi_resource.inherit_cost_center.id
}

output "remediation_task_id" {
  value = azapi_resource.remediation_inherit_cost_center.id
}
