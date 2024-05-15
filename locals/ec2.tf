resource "aws_instance" "db" {
    ami = local.ami_id
    vpc_security_group_ids = local.aws_security_name
    instance_type = local.instance_type
    tags = local.tags 
  
}