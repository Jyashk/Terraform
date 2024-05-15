variable "instance_name" {
    type = list
    default = ["db", "frontend", "backend"]
  
}


variable "tags" {
     default = {
        Name = "Expense"
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