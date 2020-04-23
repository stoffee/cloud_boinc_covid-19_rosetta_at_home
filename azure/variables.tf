variable "subscription_id" {
  default = ""
}

variable "client_id" {
  default = ""
}

variable "client_secret" {
  default = ""
}

variable "tenant_id" {
  default = ""
}

variable "prefix" {
  description = "The Prefix used for all resources in this example"
  default     = "rosetta"
}

variable "location" {
  description = "The Azure Region in which the resources in this example should exist"
  default     = "West US"
}

variable "ssh_admin_username" {
  description = "username of the ssh user"
  default     = "rosetta"
}

variable "ssh_admin_password" {
  description = "username of the ssh user"
  default     = "Password1234!"
}

