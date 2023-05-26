provider "aws" {
  region = ""
  access_key = ""
  secret_key = ""
}

resource "aws_instance" "ex2" {
  ami=""
  instance_type = "t2.micro"
  tags = {
    Name = "Terraform EC2"
  }
}