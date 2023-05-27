resource "aws_instance" "ec2_example" {
  instance_type = "t2.micro"
  ami = "ami-02eb7a4783e7e9317"
  tags = {
    Name = "Terraform EC2"
  }
}

data "aws_instance" "myawsinstance" {
    filter {
      name = "tag:Name"
      values = ["Terraform EC2"]
    }
    depends_on = [ 
        "aws_instance.ec2_example"
     ]
}

output "fetch_info_form_aws" {
  value = data.aws_instance.myawsinstance.public_ip
}