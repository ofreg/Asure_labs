variable "scope_id" {}
variable "principal_id" {}
variable "role_name" {}
variable "permissions" {
  type    = list(string)
  default = null
}
variable "not_actions" {
  type    = list(string)
  default = []
}
