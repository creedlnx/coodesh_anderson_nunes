resource "aws_instance" "ec2" {
  ami               = var.ami
  instance_type     = var.instance_type
  key_name          = var.key_name
  availability_zone = var.zona
  subnet_id         = var.subnet_id
  root_block_device {
    volume_size           = var.disk_size
    volume_type           = "gp3"
    delete_on_termination = true
  }
  tags = {
    Name = "${var.client_name}-${var.environment}"
    backup = "${var.tag}"
  }
  vpc_security_group_ids = ["${aws_security_group.sg.id}"]
}