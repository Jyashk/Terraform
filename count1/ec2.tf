resource "aws_instance" "Expense" {
  ami           = var.ami_id
  instance_type = var.instance_type
  vpc_security_group_ids = var.aws_security_group
  tags = {
    Name = "Db"
  }
}