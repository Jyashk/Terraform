resource "aws_instance" "expense" {

    count = length(var.instance_name)
    ami = "ami-090252cbe067a9e58"
    instance_type = var.instance_name[count.index] == "db" ? "t3.small" : "t3.micro"
    vpc_security_group_ids = [aws_security_group.allow_ssh.id]
    
    tags = {
         Name = var.instance_name[count.index]

    }
}

resource "aws_security_group" "allow_ssh" {

    name = "allow_ssh"
    description = "allowing ssh access"

    egress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
        //ipv6_cidr_blocks = ["::/0"]
    } 

    ingress {
        from_port        = 22
        to_port          = 22
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"]

    }


 tags = {
    Name = "allow_ssh"
  }
  
}

