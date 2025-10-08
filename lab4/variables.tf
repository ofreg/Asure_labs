variable "subscription_id" {
  type      = string
  sensitive = true
}

variable "rg_name" {
  type    = string
  default = "az104-rg4"
}

variable "location" {
  type    = string
  default = "East US"
}

variable "vnet_name" {
  type    = string
  default = "CoreServicesVnet"
}

variable "vnet_address_space" {
  type    = list(string)
  default = ["10.20.0.0/16"]
}

variable "ip_addresses" {
  type    = list(string)
  default = ["10.1.1.4"]
}
variable "ttl" {
  type    = number
  default = 1
}
