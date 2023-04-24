output "security_group_id" {
  value = aws_security_group.security_group.id
  description = "The Security Group ID"
}

output "security_group_name" {
  value = aws_security_group.security_group.name
  description = "The Security Group Name"
}