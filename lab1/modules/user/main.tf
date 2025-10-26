resource "azuread_user" "lab_user" {
  user_principal_name   = var.user_principal_name
  display_name          = var.display_name
  mail_nickname         = var.mail_nickname
  account_enabled       = true
  force_password_change = true
  password              = var.password
  job_title             = var.job_title
  department            = var.department
  usage_location        = var.usage_location
}
