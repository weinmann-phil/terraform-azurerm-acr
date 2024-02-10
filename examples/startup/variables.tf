variable "create_resource_group" {
  type = bool
}

variable "location" {
  type    = string
  default = "eastus"
}

variable "resource_group_name" {
  type    = string
  default = null
}
