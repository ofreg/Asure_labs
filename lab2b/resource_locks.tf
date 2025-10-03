resource "azurerm_management_lock" "rg_lock" {
  name       = "rg-lock"
  scope      = azurerm_resource_group.lab_rg.id
  lock_level = "CanNotDelete" 
}
