variable "region" {
  default = "us-east-1"
}

variable "key" {
  default = "coodesh"
}

variable "vpc_id" {
  default = "vpc-96759eee"
}

variable "sg_rule_all_ip"{
  default = ["0.0.0.0/0"]
}

variable "ipv4_rule"{
  default = ["170.246.69.9/32"]
}

variable "ipv6_rule"{
  default = ["2804:4f60:7e29:b200:1af:f7f8:68a9:36d2/128"]
}

variable "coodesh_availability_zone" {
  default = "us-east-1a"
}

variable "resource_name" {
  default = "$${resource_name}"
}

variable "environment" {
  default = "coodesh"
}

variable "coodesh_subnet" {
  default = "subnet-8b1217d1"
}

variable "ami" {
  default = "ami-007855ac798b5175e"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "key_name" {
  default = "coodesh"
}