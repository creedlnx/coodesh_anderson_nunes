resource "aws_security_group" "sg" {
  name        = "ec2-${var.client_name}-${var.environment}"
  description = "SG EC2 ${var.client_name}-${var.environment}"
  vpc_id      = var.vpc_id

  dynamic "ingress" {
    for_each = var.ingress_ports
    iterator = port
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = var.cdirs_coodesh_tes[*]
      security_groups = var.sgs_coodesh_test[*]
    }
  }

  egress {
    description = "Allow internet connection"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "ec2-${var.client_name}-${var.environment}"
    backup = "${var.tag}"
  }
}