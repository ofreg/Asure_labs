variable "slot_name" {
  type = string
}

variable "app_service_id" {
  type = string
}

variable "linux_fx_version" {
  type    = string
  default = "PHP|8.2"
}

variable "app_settings" {
  type    = map(string)
  default = {}
}

variable "repo_url" {
  type    = string
  default = "https://github.com/Azure-Samples/php-docs-hello-world"
}

variable "branch" {
  type    = string
  default = "master"
}
variable "github_token" {
  type      = string
  sensitive = true
}
