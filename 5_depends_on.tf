resource "aws_instance" "server1" {
  ami="ami-02eb7a4783e7e9317"
  instance_type = "t2.micro"
  depends_on = [ aws_s3_bucket.bucket1 ]
}

resource "aws_s3_bucket" "bucket1" {
  bucket = "random32115"
}