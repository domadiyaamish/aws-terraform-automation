provider "aws" {
    region = "ap-south-1"
    }
    resource "aws_instance" "myec2" {
        ami = "ami-02eb7a4783e7e9317"
        instance_type = "t2.micro"
        tags = {
            "Name" = "ec2-terraform-security"
            }
            
            }
            #security group using Terraform
            resource "aws_security_group" "TF_SG" {
                name = "security group using Terraform"
                description = "security group using Terraform"
                vpc_id = "vpc-01d43ffdf431abc78"
                ingress {
                    description = "HTTPS"
                    from_port = 443
                    to_port = 443 
                    protocol = "tcp"  
                    cidr_blocks = ["0.0.0.0/0"]
                    ipv6_cidr_blocks = ["::/0"]  
                    }
                     ingress {
                    description = "SSH"
                    from_port = 22
                    to_port = 22 
                    protocol = "tcp"  
                    cidr_blocks = ["0.0.0.0/0"]
                    ipv6_cidr_blocks = ["::/0"]  
                    }
                     ingress {
                    description = "HTTP"
                    from_port = 80
                    to_port = 80
                    protocol = "tcp"  
                    cidr_blocks = ["0.0.0.0/0"]
                    ipv6_cidr_blocks = ["::/0"]  
                    }
                    
                    egress {
                        from_port = 0
                        to_port = 0 
                        protocol = "-1"
                        cidir_blocks = ["0.0.0.0/0"]
                        ipv6_cidr_blocks = ["::/0"]
                    }

                    tags = { 
                        Name = "TF_SG"

                    }
            }