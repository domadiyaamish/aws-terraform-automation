resource "aws_instance" "ec2_example" {
  ami = ""
  instance_type = var.instance_type

  tags = {
    Name = "Terraform EC2"
  }
}

variable "instance_type" {
  description = "Instance type t2.micro"
  type = string 
  default = "t2.micro"

  validation {
    condition = can(regex("^[Tt][2-3].(nano|micro|small)",var.instance_type))
    error_message = "Invalid Instance Type name,you can only choose micro nano small"
  }
}