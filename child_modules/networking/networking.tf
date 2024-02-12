resource "aws_vpc" "wordpress-vpc" {
  cidr_block       = var.vpc_cidr
  enable_dns_hostnames = true

  tags = {
    Name = var.vpc_tag
  }
}

resource "aws_internet_gateway" "wordpress_igw" {
  vpc_id = aws_vpc.wordpress-vpc.id

  tags = {
    Name = var.igw_tag
  }
}

resource "aws_route_table" "wordpress-rt" {
  vpc_id = aws_vpc.wordpress-vpc.id

  route {
  gateway_id = aws_internet_gateway.wordpress_igw.id
  cidr_block = var.rt_cidr
  }

  tags = {
    Name = var.rt_tag
  }
}

resource "aws_subnet" "public_subnet" {
  for_each          = toset(var.availability_zones)
  vpc_id            = aws_vpc.wordpress-vpc.id
  cidr_block        = var.public_subnet_cidrs[each.key]
  availability_zone = each.value
  map_public_ip_on_launch = true
  
  tags = {
    Name = "public-subnet-${each.key}"
  }
}

resource "aws_subnet" "private_subnet" {
  for_each          = toset(var.availability_zones)
  vpc_id            = aws_vpc.wordpress-vpc.id
  cidr_block        = var.private_subnet_cidrs[each.key]
  availability_zone = each.value
  
  tags = {
    Name = "private-subnet-${each.key}"
  }
}

resource "aws_route_table_association" "public_association" {
  for_each       = aws_subnet.public_subnet
  subnet_id      = each.value.id
  route_table_id = aws_route_table.wordpress-rt.id
}



