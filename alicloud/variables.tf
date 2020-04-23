variable "vpc_cidr" {
  default = "172.16.0.0/12"
}

variable "vswitch_cidr" {
  default = "172.16.0.0/21"
}

variable "zone" {
  default = "us-west-1a"
}

variable "key_name" {
  default = "YourAlicloudSSHKeyName"
}

variable "image" {
  default = "ubuntu_18_04_64_20G_alibase_20190624.vhd"
}

variable "ecs_type" {
  default = "ecs.e4.small"
}

variable "access_key" {
  default = ""
}

variable "secret_key" {
  default = ""
}

variable "region" {
  default = "us-west-1"
}
