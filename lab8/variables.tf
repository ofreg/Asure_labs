variable "admin_username" {
  type    = string
  default = "localadmin"
}

variable "admin_password" {
  type = string
}

variable "location" {
  type    = string
  default = "canadacentral"
}

variable "subscription_id" {
  type      = string
  sensitive = true
}

variable "rg_name" {
  type    = string
  default = "az104-rg8"
}
variable "vm1_size" {
  type    = string
  default = "D2ds_v4"
}

variable "vm2_size" {
  type    = string
  default = "Standard_D2s_v3"
}