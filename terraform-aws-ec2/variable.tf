variable "ami_id" {
    type = string
    default = "ami-090252cbe067a9e58"
  
}


variable "aws_security_group" {
    type = list 
    default = ["sg-0f403663f7215d5ba"]
  
}

variable "tags" {

    type = map
    default = {
    }
  
}

variable "instance_type" {
    type = string
    default = "t3.micro"
  
}