variable "admin_username" {
  type    = string
  default = "localadmin"
}

variable "admin_password" {
  type = string
}
variable "rg_name" {
  type = string
  default = "az104-rg9"
}
variable "location" {
  type    = string
  default = "canadacentral"
}
variable "location_2" {
  type    = string
  default = "polandcentral"
}

variable "webapp_name" {
  type = string
}
variable "appservice_tier" {
  type    = string
  default = "Standard"
}
variable "appservice_sku" {
  type    = string
  default = "S1"
}
variable "appservice_capacity" {
  type    = number
  default = 1
}
variable "subscription_id" {
  type      = string
  sensitive = true
}
variable "github_token" {
  type      = string
  sensitive = true
}
