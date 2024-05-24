resource "aws_instance" "expense" {
    ami = "ami-090252cbe067a9e58"
    vpc_security_group_ids = ["sg-0f403663f7215d5ba"]
    instance_type = lookup(var.instance_type, terraform.workspace)

}