locals {
    ami_id = "ami-090252cbe067a9e58"
    aws_security_name = ["sg-024558cbe3919aa30"]
    instance_type = var.instance_name == "db" ? "t3.small" : "t3.micro"
    tags = {
        Name = "locals"
    }


}