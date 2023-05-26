provider "aws" {
  region = "eu-west-1"
  access_key = ""
  secret_key = ""
}
locals {
  string_env = "localvar1"
}

resource "aws_vpc" "staging-vpc" {
  cidr_block = "10.5.0.0/16"

  tags = {
    Name = "${local.string_env}-vpc"
  }
}

resource "aws_subnet" "staging-subnet" {
  vpc_id = aws_vpc.staging-vpc.id
  cidr_block = "10.5.0.0/16"

  tags = {
    Name = "${local.string_env}-subnet"
  }
}
resource "aws_instance" "ec2_instance" {
  ami= "ami-02eb7a4783e7e9317"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.staging-subnet.id
}