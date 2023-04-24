terraform {
  backend "s3" {
    bucket = "coodesh-bucket"
    key = "./terraform.state"
    region = "us-east-1"
  }
}

provider "aws" {
  region = var.region
}

locals {
  tags = {
    name = "coodesh"
  }
}