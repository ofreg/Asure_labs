
resource "azurerm_role_definition" "custom_role" {
  count       = var.permissions != null ? 1 : 0
  name        = var.role_name
  scope       = var.scope_id
  description = var.role_name

  permissions {
    actions     = var.permissions
    not_actions = var.not_actions
  }

  assignable_scopes = [var.scope_id]
}


resource "azurerm_role_assignment" "role_assignment" {
  scope              = var.scope_id
  principal_id       = var.principal_id
  role_definition_id = var.permissions != null ? azurerm_role_definition.custom_role[0].role_definition_resource_id : null
  role_definition_name = var.permissions == null ? var.role_name : null
}
