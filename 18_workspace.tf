provider "aws" {
  region = "eu-west-1"
  access_key = ""
  secret_key = ""
}

locals {
  instance_name = "${terraform.workspace}-instance"
}

resource "aws_instance" "ec2_example" {
  ami = "ami-02eb7a4783e7e9317"
  instance_type = "t2.micro"

  tags  = {
    Name = local.instance_name
  }
}