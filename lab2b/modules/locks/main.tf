resource "azurerm_management_lock" "rg_lock" {
  name       = "rg-lock"
  scope      = var.rg_id
  lock_level = "CanNotDelete"
}