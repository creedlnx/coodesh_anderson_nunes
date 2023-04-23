variable "ami"{
    type = string
}
variable "instance_type"{
    type = string
}
variable "key_name"{
    type = string
}
variable "availability_zone"{
    type = string
}
variable "security_group_id"{
    type = string
}
variable "subnet_id"{
    type = string
}
variable "ec2_iam_role"{
    default = ""
}
variable "instance_name"{
    type = string
}