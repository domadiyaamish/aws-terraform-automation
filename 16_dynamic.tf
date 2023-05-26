provider "aws" {
   region     = "eu-central-1"
   access_key = "AKIATQ37NXBxxxxxxxxx"
   secret_key = "JzZKiCia2vjbq4zGGGewdbOhnacmxxxxxxxxxxxx"
   
}
locals {
  ingress_rules = [{
    port  = 443
    description = "Ingress rule for port 443"
  },
  {
    port = 22
    description = "Ingress rules for port 22"
  }]
}

resource "aws_instance" "ec2_example" {
  ami = "ami-02eb7a4783e7e9317"
  instance_type = "t2.micro"
  key_name = "aws_key"
  vpc_security_group_ids = []
}

resource "aws_security_group" "main" {
  egress = [
    {
        cidr_blocks = ["0.0.0.0/0",]
        description = ""
        from_port = 0
        ipv6_cidr_blocks = []
        prefix_list_ids = []
        protocol = "-1"
        security_groups = []
        self = false
        to_port = 0
    }
  ]
  dynamic "ingress" {
    for_each = local.ingress_rules

    content {
      description = ingress.value.description
      form_port = ingress.value.port
      to_port = ingress.value.port 
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}