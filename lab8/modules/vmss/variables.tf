variable "vmss_name" {}
variable "location" {}
variable "rg_name" {}
variable "vm_size" {}
variable "instance_count" {
  default = 2
}
variable "availability_zones" {
  type    = list(string)
  default = ["1","2","3"]
}
variable "admin_username" {}
variable "admin_password" {}
variable "subnet_id" {}
variable "lb_backend_pool_id" {}
