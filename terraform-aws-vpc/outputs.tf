output "vpc_id" {
    value = aws_vpc.main.id
  
}

output "aws_internet_gateway" {

    value = aws_internet_gateway.gw.id
 
}


output "aws_database_subnet" {
    value = aws_subnet.database[*].id
  
}

output "aws_private_subnet" {
    value = aws_subnet.private[*].id
  
}

output "aws_public_subnet" {
    value = aws_subnet.public[*].id
  
}