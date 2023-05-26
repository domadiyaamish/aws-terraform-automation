# string variable
provider "aws" {
  region = "eu-west-1"
  access_key = ""
  secret_key = ""
}

resource "aws_instance" "variable" {
  ami = "ami-02eb7a4783e7e9317"
  #string 
  instance_type = var.instance_type
  #number
  count = var.instance_count
  #bool
  associate_public_ip_address = var.asscocation_public_type
  tags = {
    Name = "ec2_variable"
  }
}

#sting variable
variable "instance_type" {
  description = "this is my first variable"
  type = string
  default = "t2.micro"
}


# number variable
variable "instance_count" {
  description = "count example"
  type = number
  default = 2
}

# bool varaible 
variable "asscocation_public_type" {
  description = "bool type"
  type = bool
  default = true
}

# list varaible
resource "aws_iam_user" "exaple" {
  count = length(var.user_names)
  name = var.user_names[count.index]
}

variable "user_names" {
  description = "list varaible"
  type = list(string)
  default = ["user1", "user2", "user3"]
}