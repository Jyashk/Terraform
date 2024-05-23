resource "aws_instance" "db" {

    ami = "data.aws_ami.ami_id.id"
    vpc_security_group_ids = [""]
    instance_type = "t3.micro"

    tags = {
        Name = "db"
    }
  
}

resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic and all outbound traffic"

  tags = {
    Name = "allow_tls"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = aws_vpc.main.cidr_block
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 443
}