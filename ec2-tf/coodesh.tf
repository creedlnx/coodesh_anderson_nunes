data "template_file" "coodesh_sg_name"{
  template = var.resource_name

  vars = {
    resource_name = "coodesh-sg"
  }
}

data "template_file" "coodesh_service_name"{
  template = var.resource_name

  vars = {
    resource_name = "coodesh"
  }
}

data "template_file" "install" {
template = "${file("./scripts/coodeshStart.sh")}"
}

module "coodesh_sg"{
  source          = "./modules/sg"
  sg_name         = data.template_file.coodesh_sg_name.rendered
  sg_description  = "Coodesh Security Group"
  sg_vpc_id       = var.vpc_id
  environment     = var.environment
}

module "coodesh_sgr" {
  source                  = "./modules/sg-rule"
  sgr_security_group_name = module.coodesh_sg.security_group_name
  sgr_type                = "ingress"
  sgr_from_port           = 80
  sgr_to_port             = 80
  sgr_ipv4                = var.sg_rule_all_ip
  sgr_protocol            = "tcp"
  depends_on              = [module.coodesh_sg]
}

module "coodesh_sgr_ssh" {
  source                  = "./modules/sg-rule"
  sgr_security_group_name = module.coodesh_sg.security_group_name
  sgr_type                = "ingress"
  sgr_from_port           = 22
  sgr_to_port             = 22
  sgr_ipv4                = var.sg_rule_all_ip
  sgr_protocol            = "tcp"
  depends_on              = [module.coodesh_sg]
}

module "coodesh_sgr_outbound_all" {
  source                  = "./modules/sg-rule"
  sgr_security_group_name = module.coodesh_sg.security_group_name
  sgr_type                = "egress"
  sgr_from_port           = 0
  sgr_to_port             = 0
  sgr_ipv4                = var.sg_rule_all_ip
  sgr_protocol            = "all"
  depends_on              = [module.coodesh_sg]
}

resource "aws_instance" "ec2_instance" {
  ami                     = var.ami
  instance_type           = var.instance_type
  key_name                = var.key_name
  vpc_security_group_ids  = [module.coodesh_sg.security_group_id]
  subnet_id               = var.coodesh_subnet
  user_data               = "${data.template_file.install.rendered}"

  tags = {
    Name = "Coodesh"
  }
}