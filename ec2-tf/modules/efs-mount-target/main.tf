data "aws_efs_file_system" "efs_by_token" {
  creation_token = var.emt_efs_name
}

data "aws_security_group" "security_group" {
  name = var.emt_security_group_name
}


resource "aws_efs_mount_target" "efs_mount_target" {
  file_system_id  = data.aws_efs_file_system.efs_by_token.id
  subnet_id       = var.emt_subnet
  security_groups = [data.aws_security_group.security_group.id]


}