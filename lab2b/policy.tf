#resource "azapi_resource" "require_cost_center" {
#  type      = "Microsoft.Authorization/policyAssignments@2022-06-01"
#  name      = "require-cost-center-tag"
#  parent_id = azurerm_resource_group.lab_rg.id
#
#  body = jsonencode({
#    properties = {
#      displayName        = "Require Cost Center tag and its value on all resources"
#      description        = "Require Cost Center tag and its value on all resources in the resource group"
#      policyDefinitionId = "/providers/Microsoft.Authorization/policyDefinitions/1e30110a-5ceb-460c-a204-c1c3969c6d62"
#      enforcementMode    = "Default"
#      parameters = {
#        tagName = { value = "Cost Center" }
#        tagValue = { value = "000" }
#      }
#    }
#  })
#  lifecycle {
#    prevent_destroy = false  
#  }
#}
