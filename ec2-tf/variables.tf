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

variable "coodesh_master_availability_zone" {
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