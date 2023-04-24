terraform {
  backend "local" {
    path = "./terraform.tfstate"
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