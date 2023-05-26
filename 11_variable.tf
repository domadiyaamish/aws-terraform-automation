# string variable
provider "aws" {
  region = "eu-west-1"
  access_key = ""
  secret_key = ""
}

resource "aws_instance" "variable" {
  ami = "ami-02eb7a4783e7e9317"
  instance_type = var.instance_type
  tags = {
    Name = "ec2_variable"
  }
}

variable "instance_type" {
  description = "this is my first variable"
  type = string
  default = "t2.micro"
}


# number variable
provider "aws" {
  region = "eu-west-1"
  access_key = ""
  secret_key = ""
}

resource "aws_instance" "countinstance" {
  ami = "ami-02eb7a4783e7e9317"
  instance_type = "t2.micro"
  count = var.instance_count
  tags = {
    Name = "countinstance"
  }

}

variable "instance_count" {
  description = "count example"
  type = number
  default = 2
}