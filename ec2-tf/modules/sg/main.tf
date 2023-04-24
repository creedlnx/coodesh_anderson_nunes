resource "aws_security_group" "security_group" {
  name        = var.sg_name
  description = var.sg_description
  vpc_id      = var.sg_vpc_id

  tags = {
    Name = var.sg_name
    Environment = var.environment
  }
}