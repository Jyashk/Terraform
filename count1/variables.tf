variable "ami_id" {
    default = "ami-090252cbe067a9e58"
}

variable "instance_type" {

    default = "t3.micro"
  
}

variable "aws_security_group" {

    default = ["sg-024558cbe3919aa30", "sg-0c453f547047d0e62", "sg-0f403663f7215d5ba"]
  
}