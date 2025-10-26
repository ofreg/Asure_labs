variable "rg_name" {
  type = string
}

variable "zone_name" {
  type = string
}

variable "ttl" {
  type    = number
}

variable "ip_addresses" {
  type    = list(string)
}
