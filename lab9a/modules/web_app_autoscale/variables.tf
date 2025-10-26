variable "name" {
  type = string
}

variable "location" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "app_service_plan_id" {
  type = string
}

variable "min_capacity" {
  type    = number
  default = 1
}

variable "max_capacity" {
  type    = number
  default = 2
}

variable "default_capacity" {
  type    = number
  default = 1
}

variable "scale_up_threshold" {
  type    = number
  default = 70
}

variable "scale_down_threshold" {
  type    = number
  default = 30
}
