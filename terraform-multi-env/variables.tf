variable "instance_name" {
    # default = {
    #     frontend-dev = "t3.micro"
    #     db-dev = "t3.small"
    #     backend-dev = "t3.micro"
    # }
}

variable "environment" {

    # default = "dev"
  
}

variable "common_tags" {
    default = { 
        Project = "expense"
        Terraform = true
    }
}

variable "zone_id" {
    type = string
    default = "Z0876585SY6MKQG3XCK7"
}

variable "domain_name" {
    type = string
    default = "jupalliyashwanthkumar.online"
}

