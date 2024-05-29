Custom AWS VPC Module


![alt text](image.png)


THIS IS A MODULE USED TO CREATE VPC ALONG WITH TWO PUBLIC. PRIVATE AND DB SUBNETS. 

USERS ARE FREE TO SELECT THE SUBNET RANGE OF THEIR CHOICE. 

ALSO PROVIDED AN OPTION SELECT THE VPC PEERING. 


We are creating following resources and the subnets are created in frist two az. 


1. VPC 
2. INTERNET GATEWAY ALONG WITH VPC ATTACHMENT
3. TWO PUBLIC , TWO PRIVATE AND TWO DB
4. ELASTIC IP WITH NAT GATEWAT ASSOCIATION 
5. CREATING ROUTE TABLES AND DEFING ROUTES INSIDE THEM FOR EXAMPLE PUBLIC ROUTE WITH INTERNET GATEWAY AND NATGATEWAY WITH INTERNET FOR PRIVATE AND DB SUBNET 
6. VPC PEERING IF REQUIRED
7. ROUTES FOR VPC PEERING IN BOTH ACCEPTOR AND REQUESTOR
8. DATA BASE SUBNET.


Inputs

project_name (Required): User should mention their project name. Type is string.
environment (Optional): Default value is dev. Type is string.
common_tags (Required): User should provide their tags related to their project. Type is map.
vpc_cidr (Optional): Default value is 10.0.0.0/16. Type is string.
enable_dns_hostnames (Optional): Default value is true. Type is bool.
vpc_tags (Optional): Default value is empty. Type is map.
igw_tags (Optional): Default value is empty. Type is map.
public_subnet_cidrs (Required): User has to provide 2 valid subnet CIDR.
public_subnet_cidr_tags (Optional): Default value is empty. Type is map.
private_subnet_cidrs (Required): User has to provide 2 valid subnet CIDR.
private_subnet_cidr_tags (Optional): Default value is empty. Type is map.
database_subnet_cidrs (Required): User has to provide 2 valid subnet CIDR.
database_subnet_cidr_tags (Optional): Default value is empty. Type is map.
database_subnet_group_tags (Optional): Default value is empty. Type is map.
nat_gateway_tags (Optional): Default value is empty. Type is map.
public_route_table_tags (Optional): Default value is empty. Type is map.
private_route_table_tags (Optional): Default value is empty. Type is map.
database_route_table_tags (Optional): Default value is empty. Type is map.
is_peering_required (Optional): Default value is false. Type is bool.
acceptor_vpc_id (Optional): Default value is empty, default VPC ID would be taken. Type is string.
vpc_peering_tags (Optional): Default value is empty. Type is map.



Outputs
vpc_id: VPC ID
public_subnet_ids: A list of 2 public subnet IDS created.
database_subnet_ids: A list of 2 database subnet IDS created.
private_subnet_ids: A list of 2 private subnet IDS created.
database_subnet_group_id: A database subnet group ID created.
igw_id: internte gateway created.
terraform-aws-vpc/readme.MD at main · jupalliyashwanth.online 