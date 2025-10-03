output "all_outputs" {
  value = {
    resource_group = {
      name = "az104-rg2"
      id   = "/subscriptions/<SUBSCRIPTION_ID>/resourceGroups/az104-rg2"
    }

    lock = {
      name = "rg-lock"
    }

    policy = {
      assignment_id = "/subscriptions/<SUBSCRIPTION_ID>/resourceGroups/az104-rg2/providers/Microsoft.Authorization/policyAssignments/inherit-cost-center-tag"
      remediation_id = "/subscriptions/<SUBSCRIPTION_ID>/resourceGroups/az104-rg2/providers/Microsoft.PolicyInsights/remediations/remediate-inherit-cost-center"
    }
  }
}
