provider "aws" {
    region = "np-west-1"
}

data "aws_subnet" "selected" {
  filter {
    name = "tag:Name"
    values = [subnet1]
  }
}

resource "aws_instance" "ec2_example" {
  ami = "ami-02eb7a4783e7e9317"
  instance_type = "t2.micro"
  subnet_id = data.aws_subnet.selected
  key_name = "dev-account"

  tags = {
    Name = "data_vs_resource"
  }
}