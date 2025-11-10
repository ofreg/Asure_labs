resource "azuread_group" "group" {
  display_name     = var.display_name
  security_enabled = true
  mail_enabled     = false
  description      = var.description
}

