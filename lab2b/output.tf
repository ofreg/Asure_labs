output "resource_group_name" {
  value = "az104-rg2"
}

output "resource_group_id" {
  value = "/subscriptions/<SUBSCRIPTION_ID>/resourceGroups/az104-rg2"
}

output "lock_name" {
  value = "rg-lock"
}

output "policy_assignment_id" {
  value = "/subscriptions/<SUBSCRIPTION_ID>/resourceGroups/az104-rg2/providers/Microsoft.Authorization/policyAssignments/inherit-cost-center-tag"
}

output "policy_remediation_id" {
  value = "/subscriptions/<SUBSCRIPTION_ID>/resourceGroups/az104-rg2/providers/Microsoft.PolicyInsights/remediations/remediate-inherit-cost-center"
}
