variable "ami" {
  default = ""
}

variable "cdirs_coodesh_test" {
  type    = list(any)
  default = [""]
}

variable "sgs_coodesh_test" {
  type    = list(any)
  default = [""]
}

variable "ingress_ports" {
  type    = list(any)
  default = [80, 443]
}

variable "client_name" {
  default = "coodesh"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "environment" {
  default = "coodesh-test"
}

variable "key_name" {
  default = "coodesh"
}

variable "zona" {
  default = "us-east-1a"
}

variable "vpc_id" {
  default = ""
}

variable "subnet_id" {
  default = ""
}

variable "disk_size" {
  default = "10"
}

variable "role" {
  default = ""
}

variable "tag" {
  type = string
  default = "coodesh"
}