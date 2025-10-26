variable "name" {
  type = string
}
variable "location" {
  type = string
}
variable "rg_name" {
  type = string
}
variable "tier" {
  type = string
}
variable "sku" {
  type = string
}
variable "capacity" {
  type    = number
  default = 1
}