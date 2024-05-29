#PROJECT VARIABLES

variable "project_name" {

    type = string
    default = "expense"
  
}


variable "environment" {

    type = string 
    default = "dev"
  
}

variable "common_tags" {
    type = map 
    default = {
        Name = "expense"
        Terraform = "ture"
        Environment = "dev"
    }
  
}


#VPC VARIABLES 


variable "vpc_tags" {

    type = map 
    default = {}
}

variable "public_subnet_cidrs" {

    type = list 
    default = ["10.0.1.0/24","10.0.2.0/24"]
  
}

variable "private_subnet_cidrs" {

    type = list 
    default = ["10.0.11.0/24","10.0.21.0/24"]
  
}

variable "private_subnet_tags" {

    default = {}
  
}

variable "database_subnet_cidrs" {

    type = list 
    default = ["10.0.31.0/24","10.0.41.0/24"]
  
}

variable "database_subnet_tags" {

    default = {}
  
}


#VPC PERRING
variable "is_peerng_required" {
    type = bool
    default = true
  
}