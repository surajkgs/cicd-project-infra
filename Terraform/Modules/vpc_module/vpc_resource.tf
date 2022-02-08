//Resource for VPC
resource "aws_vpc" "vpc_resource" {
  cidr_block       = var.vpc_cidr_block_var
  instance_tenancy = "default"

  enable_dns_hostnames = true
  enable_dns_support = true

  tags = {
    Name = var.vpc_name_var
  }
}


//Resource for public Subnets
resource "aws_subnet" "public_subnet_resource" {
  count = length(var.public_subnet_cidr)
  vpc_id     = aws_vpc.vpc_resource.id
  cidr_block = var.public_subnet_cidr[count.index]
  availability_zone = var.availability_zone_var[count.index]
  map_public_ip_on_launch = true
  tags = {
    Name = var.public_subnet_names[count.index]
  }
}


//Resource for private Subnets
resource "aws_subnet" "private_subnet_resource" {
  count = length(var.private_subnet_cidr)
  vpc_id     = aws_vpc.vpc_resource.id
  cidr_block = var.private_subnet_cidr[count.index]
  availability_zone = var.availability_zone_var[count.index]
  tags = {
    Name = var.private_subnet_names[count.index]
  }
}



//Resource for internet Gateway
resource "aws_internet_gateway" "ig_resource" {
  vpc_id = aws_vpc.vpc_resource.id

  tags = {
    Name = var.ig_var
  }
}

//Resource for private route table
resource "aws_route_table" "private_route_table_resource" {
  /* count = length(var.private_subnet_cidr_blocks) */

  vpc_id = aws_vpc.vpc_resource.id

  tags = {
      Name        = "lear_private_route_table",
    }
}
//Resource for private route
/* resource "aws_route" "private_route_resource" {
  count = length(var.private_subnet_cidr_blocks)

  route_table_id         = aws_route_table.private_route_table_resource.id
  destination_cidr_block = "0.0.0.0/0"
   nat_gateway_id         = aws_nat_gateway.default[count.index].id
 } */





//Resource for public route table
resource "aws_route_table" "public_route_table_resource" {
  vpc_id = aws_vpc.vpc_resource.id

   tags = {
      Name        = "lear_public_route_table",
    }
}
//Resource for private route
resource "aws_route" "public_route_resource" {
  route_table_id         = aws_route_table.public_route_table_resource.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.ig_resource.id
}





resource "aws_route_table_association" "private" {
  /* count = length(var.private_subnet_cidr_blocks) */
  count = length(var.private_subnet_cidr)
  subnet_id      = aws_subnet.private_subnet_resource[count.index].id
  route_table_id = aws_route_table.private_route_table_resource.id
}


resource "aws_route_table_association" "public" {
  /* count = length(var.public_subnet_cidr_blocks) */
  count = length(var.public_subnet_cidr)
  subnet_id      = aws_subnet.public_subnet_resource[count.index].id
  route_table_id = aws_route_table.public_route_table_resource.id
}
