variable "rg_name" {
  type = string
}

variable "zone_name" {
  type = string
}

variable "link_name" {
  type = string
}

variable "vnet_id" {
  type = string
}

variable "record_name" {
  type = string
}

variable "ttl" {
  type    = number
  default = 1
}

variable "ip_addresses" {
  type    = list(string)
  default = ["10.1.1.4"]
}
