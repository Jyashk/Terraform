resource "aws_instance" "db" {
    ami = data.aws_ami.ami_id.id
    vpc_security_group_ids = [ "sg-0f403663f7215d5ba" ]
    instance_type = "t3.micro"

    tags = {
      Name = "Data-source-practice"
    }
  
}