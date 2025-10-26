variable "subscription_id" {
  type      = string
  sensitive = true
}

variable "location" {
  type    = string
  default = "East US"
}

variable "rg_name" {
  default = "az104-rg7"
}

variable "storage_name" {
  default = "stacmunaq"
}
variable "vnet_name" {
  default = "vnet1"
}

variable "subnet_name" {
  default = "default"
}

variable "share_name" {
  default = "share1"
}

variable "file_path" {
  default = "files/test.txt"
}