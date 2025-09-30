resource "azurerm_role_assignment" "helpdesk_vm_contributor" {
  scope                = azurerm_management_group.managemntgroup.id
  role_definition_name = "Virtual Machine Contributor"
  principal_id         = azuread_group.helpdesk.object_id
 
}
