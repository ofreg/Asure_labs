resource "azapi_resource" "inherit_cost_center" {
  type      = "Microsoft.Authorization/policyAssignments@2022-06-01"
  name      = "inherit-cost-center-tag"
  parent_id = azurerm_resource_group.lab_rg.id

  body = jsonencode({
    location = "eastus"
    identity = {
      type = "SystemAssigned"
    }
    properties = {
      displayName        = "Inherit the Cost Center tag and its value 000 from the resource group if missing"
      description        = "Inherit the Cost Center tag and its value 000 from the resource group if missing"
      policyDefinitionId = "/providers/Microsoft.Authorization/policyDefinitions/ea3f2387-9b95-492a-a190-fcdc54f7b070"
      enforcementMode    = "Default"
      parameters = {
        tagName = {
          value = "Cost Center"
        }
      }
    }
  })
}

resource "azapi_resource" "remediation_inherit_cost_center" {
  type      = "Microsoft.PolicyInsights/remediations@2021-10-01"
  name      = "remediate-inherit-cost-center"
  parent_id = azurerm_resource_group.lab_rg.id   

  body = jsonencode({
    properties = {
      policyAssignmentId    = azapi_resource.inherit_cost_center.id
      resourceDiscoveryMode = "ExistingNonCompliant"
    }
  })
}

