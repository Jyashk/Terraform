data "aws_ami" "ami_id" {
  //executable_users = ["self"]
  most_recent      = true
  //name_regex       = "^myami-\\d{3}"
  //owners           = ["self"]

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

data "aws_vpc" "default" {
    default = true
}