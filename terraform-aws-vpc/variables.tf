## Project ##

variable "project_name" {
    type = string 
}

variable "environment" {
    type = string
}

variable "common_tags" {
    type = map 
}

### VPC

variable "cidr" {
    type = string
    default = "10.0.0.0/16"
  
}


variable "enable_dns_hostnames" {

    type = bool
    default = true
  
}

variable "vpc_tags" {

    type = map 
    default = {}
  
}


#### IGW tags 

variable "igw_tags" {
    type = map 
    default = {}
  
}

###  Subnet ### 

variable "public_subnet_tags" {
    type = map 
    default = {}
  
}

variable "public_subnet_cidrs" {

    type = list
    validation {
      condition = length(var.public_subnet_cidrs) == 2
      error_message = "Please provide 2 valid subnet cidr range"
    }
  
}

variable "private_subnet_cidrs" {

   type = list 
validation {
   condition = length(var.private_subnet_cidrs) == 2
   error_message = "Please provide 2 valid subnet cidr range for private subnet"
}
}

variable "private_subnet_tags" {

    type = map
  
}

variable "database_subnet_cidrs" {

   type = list 
validation {
   condition = length(var.database_subnet_cidrs) == 2
   error_message = "Please provide 2 valid subnet cidr range for database subnet"
}
}

variable "database_subnet_tags" {

    type = map
  
}

# NAT GATEWAY
variable "nat_gateway_tags" {

    type = map
    default = {}
  
}

#ROUTE 
variable "public_routetable_tags" {

    type = map 
    default = {}
  
}

variable "private_routetable_tags" {

    type = map 
    default = {}
  
}

variable "database_routetable_tags" {

    type = map 
    default = {}
  
}


#PEERING 
variable "is_peerng_required" {

    type = bool
    default = true
}

variable "acceptors_vpc_id" {
    type = string
    default = ""
  
}

variable "vpc_peering_tags" {

    type = map 
    default = {}
  
}

variable "database_subnet_group_tags" {

    type = map 
    default = {}
  
}


