variable "subscription_id" {
  type      = string
  sensitive = true
}

variable "location" {
  type        = string
  default     = "East US"
}

variable "rg_name" {
  default = "az104-rg6"
}

variable "admin_username" {
  type        = string
  default     = "localadmin"
}

variable "admin_password" {
  type        = string
  sensitive   = true
}

variable "vm_size" {
  type        = string
  default     = "Standard_B1s"
}