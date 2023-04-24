resource "aws_efs_file_system" "efs" {
  creation_token          = var.efs_name
  availability_zone_name  = var.efs_availability_zone

  tags = {
    Name = var.efs_name
    environment = var.environment
  }
}
