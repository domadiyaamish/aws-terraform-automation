provider "aws" {
        region = "ap-south-1"
}

resource "aws_instance" "myec2" {
        ami = "ami-02eb7a4783e7e9317"
        instance_type = "t2.micro"
        count = 5
        tags = {
                "Name" = "ec2-terraform"
        }
}