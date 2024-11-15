resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr_block

  tags = {
    Name = "ass01_VPC"
  }
}

# Create a subnet within the VPC
resource "aws_subnet" "subnet" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.subnet_cidr_block
  availability_zone = "us-east-1a"

  tags = {
    Name = "ass01_Subnet"
  }
}

# Create an internet gateway for the VPC
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "ass01_IGW"
  }
}

# Create a route table and associate it with the subnet
resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "ass01_RT"
  }
}

# Associate the route table with the subnet
resource "aws_route_table_association" "example_route_table_assoc" {
  subnet_id      = aws_subnet.subnet.id
  route_table_id = aws_route_table.rt.id
}
