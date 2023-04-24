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

data "template_file" "coodesh_volume"{
  template = var.resource_name

  vars = {
    resource_name = "coodesh-volume"
  }
}

module "coodesh_sg"{
  source          = "/Users/anderson/Git/Coodesh/coodesh_anderson_nunes/ec2-tf/modules/sg"
  sg_name         = data.template_file.coodesh_sg_name.rendered
  sg_description  = "Coodesh Security Group"
  sg_vpc_id       = var.vpc_id
  environment     = var.environment
}

module "coodesh_sgr" {
  source                  = "/Users/anderson/Git/Coodesh/coodesh_anderson_nunes/ec2-tf/modules/sg-rule"
  sgr_security_group_name = module.coodesh_sg.security_group_name
  sgr_type                = "ingress"
  sgr_from_port           = 80
  sgr_to_port             = 80
  sgr_ipv4                = var.sg_rule_all_ip
  sgr_protocol            = "tcp"
  depends_on              = [module.coodesh_sg]
}

module "coodesh_sgr_outbound_all" {
  source                  = "/Users/anderson/Git/Coodesh/coodesh_anderson_nunes/ec2-tf/modules/sg-rule"
  sgr_security_group_name = module.coodesh_sg.security_group_name
  sgr_type                = "egress"
  sgr_from_port           = 0
  sgr_to_port             = 0
  sgr_ipv4                = var.sg_rule_all_ip
  sgr_protocol            = "all"
  depends_on              = [module.coodesh_sg]
}

data "template_file" "coodesh_startup_script"{
  template = file("scripts/coodeshStart.sh")
  vars = {
    efs_id = module.coodesh_efs.efs_id
  }
}

module "coodesh_efs" {
  source                = "/Users/anderson/Git/Coodesh/coodesh_anderson_nunes/ec2-tf/modules/efs"
  efs_name              = data.template_file.coodesh_volume.rendered
  efs_availability_zone = var.coodesh_master_availability_zone
  efs_tags              = local.tags
  environment           = var.environment
}

module "coodesh_volume"{
  source                  = "/Users/anderson/Git/Coodesh/coodesh_anderson_nunes/ec2-tf/modules/efs-mount-target"
  emt_efs_name            = data.template_file.coodesh_volume.rendered
  emt_subnet              = var.coodesh_subnet
  emt_security_group_name = data.template_file.coodesh_sg_name.rendered
  depends_on              = [module.coodesh_efs, module.coodesh_sg]
}