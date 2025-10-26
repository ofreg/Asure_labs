resource "azuread_group" "lab_group" {
  display_name     = var.display_name
  mail_enabled     = false
  security_enabled = true
  description      = "Administrators that manage the IT lab"
}

resource "azuread_group_member" "lab_group_member1" {
  group_object_id  = azuread_group.lab_group.object_id
  member_object_id = var.lab_user_id
}
resource "azuread_group_member" "external_member" {
  group_object_id  = azuread_group.lab_group.object_id
  member_object_id = var.external_user_id
}
