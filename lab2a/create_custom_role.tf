resource "azurerm_role_definition" "custom_support_request" {
  name        = "Custom Support Request"
  scope       = azurerm_management_group.managemntgroup.id
  description = "A custom contributor role for support requests."

  
  permissions {
    actions     = [
      "*/read",
      "Microsoft.Support/*/read",
      "Microsoft.Support/*/write"
      
    ]
    not_actions = [
      "Microsoft.Support/register/action" 
    ]
  }

  assignable_scopes = [
    azurerm_management_group.managemntgroup.id
  ]
}

resource "azurerm_role_assignment" "helpdesk_custom_support" {
  scope              = azurerm_management_group.managemntgroup.id
  role_definition_id = azurerm_role_definition.custom_support_request.role_definition_resource_id
  principal_id       = azuread_group.helpdesk.object_id
}
