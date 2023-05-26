#step 1 create a VPC
resource "aws_vpc" "myfirstvpc" {
  cidr_block = "10.0.0.0/24"
  tags = {
    Name = "MyterraformVPC"
  }
}

#step 2 public subnet
resource "aws_subnet" "publicsubnet" {
    vpc_id = aws_vpc.myfirstvpc.id
    cidr_block = "10.0.1.0/24"
}

#step 3 private subnet
resource "aws_subnet" "privatesubnet" {
  vpc_id = aws_vpc.myfirstvpc.id
  cidr_block =  "10.0.2.0/24"
}

#step 4 create a internate gateway
resource "aws_internet_gateway" "ing" {
    vpc_id = aws_vpc.myfirstvpc.id
}

#step 5 route table for public subnet
resource "aws_route_table" "publicRT" {
  vpc_id = aws_vpc.myfirstvpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ing.id 
  }
}

#step 6 route table association public subnet
resource "aws_route_table_association" "publicRTasso" {
  subnet_id = aws_subnet.publicsubnet.id
  route_table_id = aws_route_table.publicRT.id
  
}