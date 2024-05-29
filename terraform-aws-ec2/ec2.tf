# resource <resource-type> <resource-name>
resource "aws_instance" "db" {

    ami = var.ami_id
    vpc_security_group_ids = var.aws_security_group
    instance_type = var.instance_type

    tags = var.tags
}