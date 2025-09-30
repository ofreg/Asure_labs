resource "azuread_group" "helpdesk" {
  display_name     = "Help Desk"
  security_enabled = true
  mail_enabled     = false
  description      = "Help Desk support group"
}