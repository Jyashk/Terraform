data "aws_ami" "expense" {
  most_recent      = true

  filter {
    name   = "name"
    values = ["RHEL-9-DevOps-Practice"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_instance" "expense" {
  count = length(var.instance_name)
  ami           = data.aws_ami.expense.id
  instance_type = var.instance_name[count.index] == "db" ? "t3.small" : "t3.micro"
  vpc_security_group_ids = ["sg-0f403663f7215d5ba"]
  


  tags = {
    Name = var.instance_name[count.index]
  }
}