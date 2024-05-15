output "ami_id" {
    value = data.aws_ami.ami_id.id
}

output "aws_vpc" {
    value = data.aws_vpc.default
  
}