module "ec2" {
  source        = ".terraform/modules"
  version       = "0.0.7"
  ami           = var.ami
  cdirs_acesso  = var.cdirs_coodesh_test
  ingress_ports  = var.ingress_ports
  client_name   = var.client_name
  instance_type = var.instance_type
  environment   = var.environment
  key_name      = var.key_name
  zona          = var.zona
  subnet_id     = var.subnet_id
  vpc_id     = var.vpc_id
  disk_size     = var.disk_size
  sgs_acesso = var.sgs_coodesh_test
  tag = var.tag
}