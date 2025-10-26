variable "user_email_address" {}
variable "redirect_url" {}
variable "user_display_name" {}
variable "additional_recipients" {
  type = list(string)
}
