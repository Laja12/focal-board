resource "aws_vpc" "my-vpc" {
    cidr_block = var.cidr_block
    
    tags = {
        Name = "my-vpc"
    }
}

resource "aws_subnet" "public_subnet" {
    vpc_id            = aws_vpc.my-vpc.id
    cidr_block        = var.public_subnet_cidr_1
    availability_zone = "us-east-1a"

    tags = {
        Name = "public-subnet"
    }
  
}

resource "aws_subnet" "public_subnet_2" {
  vpc_id = aws_vpc.my-vpc.id
  cidr_block = var.public_subnet_cidr_2
  availability_zone = "us-east-1b"
  tags = {
    Name = "public-subnet-2"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.my-vpc.id
  tags = {
    Name = "my-internet-gateway"
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.my-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "public-route-table"
  }
}

resource "aws_route_table_association" "public_subnet" {
    subnet_id      = aws_subnet.public_subnet.id
    route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public_subnet_2" {
    subnet_id      = aws_subnet.public_subnet_2.id
    route_table_id = aws_route_table.public.id
  
}
