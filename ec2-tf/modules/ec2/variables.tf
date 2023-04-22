variable "ami" {}

variable "cdirs_coodesh_test" {
  type = list(any)
}

variable "sgs_coodesh_test" {
  type = list(any)
}

variable "ingress_ports" {
  type = list(any)
}

variable "client_name" {}

variable "instance_type" {}

variable "environment" {}

variable "key_name" {}

variable "zona" {}

variable "subnet_id" {}

variable "vpc_id" {}

variable "disk_size" {}

variable "tag" {}