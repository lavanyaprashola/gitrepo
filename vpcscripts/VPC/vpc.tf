provider "aws" {
  region = "us-west-2"
}

resource "aws_vpc" "test-vpc" {
  cidr_block = var.vpc_cidr
}

resource "aws_internet_gateway" "test-igw" {
  vpc_id = aws_vpc.test-vpc.id
}

resource "aws_subnet" "test-pub-sub" {
  vpc_id = aws_vpc.test-vpc.id
  cidr_block = var.Pub_cidr
  availability_zone = "us-west-2a"
}

resource "aws_subnet" "test-priv-sub" {
  vpc_id = aws_vpc.test-vpc.id
  cidr_block = var.Pri_cidr
  availability_zone = "us-west-2a"
}

resource "aws_route_table" "test-pub-rtbl" {
  vpc_id = aws_vpc.test-vpc.id
}

resource "aws_route_table" "test-priv-rtbl" {
  vpc_id = aws_vpc.test-vpc.id
}

resource "aws_route" "test-pub-rt" {
  route_table_id = aws_route_table.test-pub-rtbl.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.test-igw.id
}


resource "aws_eip" "test-eip" {
}

resource "aws_nat_gateway" "test-nat" {
  allocation_id = aws_eip.test-eip.id
  subnet_id = aws_subnet.test-pub-sub.id
}

resource "aws_route" "test-priv-rt" {
  route_table_id = aws_route_table.test-priv-rtbl.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_nat_gateway.test-nat.id
}


