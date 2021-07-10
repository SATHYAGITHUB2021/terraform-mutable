resource "aws_vpc_peering_connection" "peer-connection" {
  peer_vpc_id   = aws_vpc.main.id
  vpc_id        = var.DEFAULT_VPC_ID
  auto_accept   = true
}

#auto accept is only possible if two vpc's are in same aws account.