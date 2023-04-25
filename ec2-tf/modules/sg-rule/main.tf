data "aws_security_group" "security_group" {
  name = var.sgr_security_group_name
}

resource "aws_security_group_rule" "example" {
  type              = var.sgr_type
  from_port         = var.sgr_from_port
  to_port           = var.sgr_to_port
  protocol          = var.sgr_protocol
  cidr_blocks       = var.sgr_ipv4
  ipv6_cidr_blocks  = var.sgr_ipv6
  security_group_id = data.aws_security_group.security_group.id
}