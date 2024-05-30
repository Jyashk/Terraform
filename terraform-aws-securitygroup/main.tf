resource "aws_security_group" "allow_tls" {
  name        = local.sg_name
  description = var.description
  vpc_id      = var.vpc_id

  tags = {
    Name = "allow_tls"
  }
}