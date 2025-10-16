variable "vm_name" {
  type = string
}

variable "location" {
  type = string
}

variable "rg_name" {
  type = string
}

variable "vm_size" {
  type = string
}

variable "admin_username" {
  type = string
}

variable "admin_password" {
  type = string
  sensitive = true
}

variable "nic_id" {
  type = string
}

variable "availability_zone" {
  type = string
}

variable "data_disks" {
  type = list(object({
    name         = string
    size_gb      = number
    storage_type = string
  }))
  default = []
}