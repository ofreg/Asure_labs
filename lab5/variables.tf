variable "subscription_id" {
  type      = string
  sensitive = true
}

variable "rg_name" {
  type    = string
  default = "az104-rg5"
}
variable "location" {
  type    = string
  default = "East US"
}

variable "admin_password" {
  type      = string
  sensitive = true
}

variable "admin_username" {
  type    = string
  default = "localadmin"
}

variable "network_watcher_name" {
  type    = string
  default = "NetworkWatcher"
}
