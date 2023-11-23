#CREATE VPC
resource "aws_vpc" "ec2-windows-vpc" {
  cidr_block       = "10.0.0.0/16"
  enable_dns_hostnames  = true
  enable_dns_support    = true

  tags = {
    Name = "ec2-windows-vpc"
  }

}
#CREATE SUBNET
resource "aws_subnet" "subnet" {
 vpc_id     = aws_vpc.ec2-windows-vpc.id
 cidr_block = "10.0.1.0/24"
 availability_zone = "us-east-1a"
 
 tags = {
   Name = "PrivateSubnet"
 }
}

#CREATE INTERNET GATEWAY FOR PUBLIC ACCESS
resource "aws_internet_gateway" "ec2-windows-igw" {
  vpc_id     = aws_vpc.ec2-windows-vpc.id
  tags = {
    Name = "ec2-windows-igw"
  }
}

#CREATE ROUTE TABLE FOR PUBLIC ACCESS
resource "aws_route_table" "ec2-windows-rtb" {
  vpc_id     = aws_vpc.ec2-windows-vpc.id
  route {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_internet_gateway.ec2-windows-igw.id
  }
    tags = {
    Name = "ec2-windows-rtb"
  }
}

##ASSOCIATE ROUTES ON ROUTE TABLE
resource "aws_route_table_association" "new-rtb-association" {
    route_table_id = aws_route_table.ec2-windows-rtb.id
    subnet_id     = aws_subnet.subnet.id
}


#SET PUBLIC IP
resource "aws_eip" "ec2_eip" {
  domain   = "vpc"
}

#NAT GATEWAY CONFIG
resource "aws_nat_gateway" "ec2_nat_gw" {
  allocation_id = aws_eip.ec2_eip.id
  subnet_id     = aws_subnet.subnet.id

  tags = {
    Name = "NATGATEWAY-CONFIGS"
  }

}
#ROUTE TABLE FOR NAT GATEWAY
resource "aws_route_table" "ec2_nat_rt" {
  vpc_id  = aws_vpc.ec2-windows-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.ec2_nat_gw.id
  }
}

#SECURITY RULES FOR EXTERNAL/INTERNAL ACCESS
resource "aws_security_group" "allow-access" {
  name       = "allow-access"
  vpc_id     = aws_vpc.ec2-windows-vpc.id
  
  egress {
  from_port = 0
  to_port = 0
  protocol = "-1"
  cidr_blocks = ["0.0.0.0/0"]
  }
  
  ingress {
  from_port = 0
  to_port = 6556
  protocol = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  }
 
  tags = {
    Name = "Allow RDP"
  }
 
}