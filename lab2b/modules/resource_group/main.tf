

resource "azurerm_resource_group" "lab_rg" {
  name     = var.rg_name
  location = var.location
  tags = {
    "Cost Center" = "000"
  }
}