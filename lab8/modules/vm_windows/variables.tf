variable "vm_name" {}
variable "location" {}
variable "rg_name" {}
variable "vm_size" {
  default = "Standard_B1ls"
}
variable "availability_zone" {
  default = "1"
}
variable "admin_username" {}
variable "admin_password" {}
variable "nic_id" {}
