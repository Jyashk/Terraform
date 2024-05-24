data "aws_ami" "expense" {
  most_recent = true

  filter {
    name   = "name"
    values = ["RHEL-9-DevOps-Practice"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

}
resource "aws_instance" "db" {
  ami      = data.aws_ami.expense.id
  instance_type = "t3.micro"
  vpc_security_group_ids = ["sg-0f403663f7215d5ba"]



provisioner "local-exec" {
    command = "echo ${self.private_ip} > private_ip.txt" # Here seld 
  }

# provisioner "local-exec" {
#     command = "ansible-playbook -i private_ips.txt web.yaml" # Here seld 
#   }

connection {
    type     = "ssh"
    user     = "ec2-user"
    password = "DevOps321"
    host     = self.public_ip
  }

provisioner "remote-exec" {
    inline = [
      "id",
      "sudo dnf install ansible -y",
      "sudo dnf install nginx -y",
      "sudo systemctl start nginx "
    ]
  }

}

