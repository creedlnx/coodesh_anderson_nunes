resource "aws_instance" "ec2_instance" {
  ami                     = var.ami
  instance_type           = var.instance_type
  key_name                = var.key_name
  availability_zone       = var.availability_zone
  vpc_security_group_ids  = var.security_group_id
  subnet_id               = var.subnet_id
  iam_instance_profile    = var.ec2_iam_role

  tags = {
    Name = var.instance_name
  }
}