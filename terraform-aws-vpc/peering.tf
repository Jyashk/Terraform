resource "aws_vpc_peering_connection" "peering" {
  count = var.is_peerng_required ? 1 :0
  peer_vpc_id   = var.acceptors_vpc_id ==  "" ? data.aws_vpc.default.id : var.acceptors_vpc_id  # acceptor
  vpc_id        = aws_vpc.main.id # requestor
  auto_accept   = var.acceptors_vpc_id == "" ? true : false   

  tags = merge(
    var.common_tags,
    var.vpc_peering_tags,
    {
      Name = "${local.resource}-dev"
    }
  )

}

resource "aws_route" "public_peering" {
  count = var.is_peerng_required && var.acceptors_vpc_id == "" ? 1 : 0
  route_table_id            = aws_route_table.public.id
  destination_cidr_block    = data.aws_vpc.default.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.peering[count.index].id
}

resource "aws_route" "private_peering" {
  count = var.is_peerng_required && var.acceptors_vpc_id == "" ? 1 : 0
  route_table_id            = aws_route_table.private.id
  destination_cidr_block    = data.aws_vpc.default.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.peering[count.index].id
}

resource "aws_route" "database_peering" { 
  count = var.is_peerng_required && var.acceptors_vpc_id == "" ? 1 : 0
  route_table_id            = aws_route_table.database.id
  destination_cidr_block    = data.aws_vpc.default.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.peering[count.index].id
}

resource "aws_route" "default_peering" { 
  count = var.is_peerng_required && var.acceptors_vpc_id == "" ? 1 : 0
  route_table_id            = data.aws_vpc.default.main_route_table_id
  destination_cidr_block    = var.cidr
  vpc_peering_connection_id = aws_vpc_peering_connection.peering[count.index].id
}