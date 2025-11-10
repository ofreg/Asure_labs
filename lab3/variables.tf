variable "subscription_id" {
  type      = string
}

variable "rg_name" {
  type        = string
  default     = "az104-rg3"
}

variable "location" {
  type        = string
  default = "polandcentral"
}


variable "disk_size_gb" {
  type        = number
  default     = 32
}

variable "storage_type" {
  type        = string
  default     = "Standard_LRS" 
}
