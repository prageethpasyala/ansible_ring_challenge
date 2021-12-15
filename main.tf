# VPC
resource "aws_vpc" "main_vpc" {
  cidr_block = var.vpc_cidr

  tags = {
      Name = var.vpc_name
  }
}

# INTERNET GATEWAY
resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.main_vpc.id

  tags = {
    Name = var.internet_gw_name
  }
}

# SUBNETS
## PUBLIC
resource "aws_subnet" "public_a" {
  vpc_id     = aws_vpc.main_vpc.id
  cidr_block = var.public_a_cidr
  availability_zone = "${var.region}a"
  map_public_ip_on_launch = true

  tags = {
    Name = "talent-academy-public-a"
  }
}

## PRIVATE
resource "aws_subnet" "private_a" {
  vpc_id     = aws_vpc.main_vpc.id
  cidr_block = var.private_a_cidr
  availability_zone = "${var.region}a"

  tags = {
    Name = "talent-academy-private-a"
  }
}
resource "aws_subnet" "private_b" {
  vpc_id     = aws_vpc.main_vpc.id
  cidr_block = var.private_b_cidr
  availability_zone = "${var.region}b"

  tags = {
    Name = "talent-academy-private-b"
  }
}
resource "aws_subnet" "private_c" {
  vpc_id     = aws_vpc.main_vpc.id
  cidr_block = var.private_c_cidr
  availability_zone = "${var.region}c"

  tags = {
    Name = "talent-academy-private-c"
  }
}

resource "aws_subnet" "private_d" {
  vpc_id     = aws_vpc.main_vpc.id
  cidr_block = var.private_d_cidr
  availability_zone = "${var.region}c"

  tags = {
    Name = "talent-academy-private-d"
  }
}

resource "aws_subnet" "private_e" {
  vpc_id     = aws_vpc.main_vpc.id
  cidr_block = var.private_e_cidr
  availability_zone = "${var.region}c"

  tags = {
    Name = "talent-academy-private-e"
  }
}


## NAT GW
resource "aws_eip" "nat_a_eip" {
  vpc      = true
}

resource "aws_nat_gateway" "nat_a" {
  allocation_id = aws_eip.nat_a_eip.id
  subnet_id     = aws_subnet.public_a.id

  tags = {
    Name = "NAT Gateway"
  }

  depends_on = [aws_internet_gateway.internet_gateway]
}