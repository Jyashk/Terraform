module "aws_ec2" {
    source = "../terraform-aws-ec2"
    //instance_type = "t3.small"
    tags = {
        Name = "Module-development"
        Created-By-Terraform = true
    }

}