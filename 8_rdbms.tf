#create a rdbms database
resource "aws_db_instance" "myrds" {
  engine = "mysql"
  engine_version = "8.0.27"
  allocated_storage = 20
  instance_class = "db.t3.micro"
  storage_type = "gp2"
  identifier = "mydb"
  username = "admin"
  password = "passw0rd123"
  publicly_accessible = true
  skip_final_snapshot = true

  tags = {
    Name = "Myrdsdb"
  }
}