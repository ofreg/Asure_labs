output "user_principal_name" {
  value = azuread_user.lab_user.user_principal_name
}
output "display_name" {
  value = azuread_user.lab_user.display_name
}
output "user_object_id" {
  value = azuread_user.lab_user.object_id
}
