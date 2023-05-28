provider "aws" {
    region = ""
    access_key = ""
    secret_key = ""
}

resource "aws_instance" "ec2_example" {
  ami = ""
  instance_type = "t2.micro"
  tags = {
    Name = "EC2 Instance with remote state"
  }
}

terraform{
    backend "s3" {
        bucket = "first-terraform-s3-bucket"
        key = "terraform/remote/s3/terraform.tfstate"
        region = "en-west-1"
        dynamodb_table = "dynamodb-state-locking"
    }
}