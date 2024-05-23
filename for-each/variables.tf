variable "instance_names" {
    default = {
        db = "t3.small"
        frontend = "t3.micro"
        backend = "t3.micro"
    }
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