resource "aws_vpc" "main" {
  cidr_block       = var.cidr
  instance_tenancy = "default"
  enable_dns_hostnames = var.enable_dns_hostnames

  tags = merge(
         var.common_tags,
         var.vpc_tags,
         {
            Name = local.resource
         }
  )
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = merge (
         var.common_tags,
         var.igw_tags,
        {
          Name = local.resource
        }
  )
}

resource "aws_subnet" "public" {
  count = length(var.public_subnet_cidrs)
  vpc_id     = aws_vpc.main.id
  cidr_block = var.public_subnet_cidrs[count.index]
  availability_zone = local.az_info[count.index]
  map_public_ip_on_launch = true
  tags = merge (
         var.common_tags,
         var.public_subnet_tags,
        {
          Name = "${local.resource}-public-${local.az_info[count.index]}"
        }
  )
}

resource "aws_subnet" "private" {
  count = length(var.private_subnet_cidrs)
  vpc_id     = aws_vpc.main.id
  cidr_block = var.private_subnet_cidrs[count.index]
  availability_zone = local.az_info[count.index]
  tags = merge (
    var.common_tags,
    var.private_subnet_tags,
    {
      Name = "${local.resource}-private-${local.az_info[count.index]}"
    }
  )
}

resource "aws_subnet" "database" {
  count = length(var.database_subnet_cidrs)
  vpc_id     = aws_vpc.main.id
  cidr_block = var.database_subnet_cidrs[count.index]
  availability_zone = local.az_info[count.index]
  tags = merge (
    var.common_tags,
    var.database_subnet_tags,
    {
      Name = "${local.resource}-database-${local.az_info[count.index]}"
    }
  )
}

resource "aws_db_subnet_group" "default" {
  name       = "${var.project_name}-${var.environment}"
  subnet_ids = aws_subnet.database[*].id

  tags = merge (
    var.common_tags,
    var.database_subnet_group_tags,
    {
      Name = "${local.resource}-database-subnet-groups"
    }
  )
}

resource "aws_eip" "lb" {

  domain   = "vpc"
}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.lb.id
  subnet_id     = aws_subnet.public[0].id

  tags = merge (
    var.common_tags,
    var.nat_gateway_tags,
    {
      Name = local.resource
    }
  )


  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.gw]
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id

  }

  tags = merge (
    var.common_tags,
    var.public_routetable_tags,
    {
      Name = "${local.resource}-public"
    }
  )
}


resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat.id
    
  }

  tags = merge (
    var.common_tags,
    var.private_routetable_tags,
    {
      Name = "${local.resource}-private"
    }
  )
}

resource "aws_route_table" "database" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat.id
  }

  tags = merge (
    var.common_tags,
    var.database_routetable_tags,
    {
      Name = "${local.resource}-database"
    }
  )
}


resource "aws_route_table_association" "public_subnetassoication" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}

