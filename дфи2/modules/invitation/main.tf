resource "azuread_invitation" "external_user" {
  user_email_address = var.user_email_address
  redirect_url       = var.redirect_url
  user_display_name  = var.user_display_name
  user_type          = "Guest"

  message {
    body                  = "Welcome to Azure and our group project"
    additional_recipients = var.additional_recipients
  }
}
