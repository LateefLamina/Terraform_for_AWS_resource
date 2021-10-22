

# create security group
resource "aws_security_group" "rds-db-sg" {
  name   = "mysql-security-group"
  vpc_id = aws_vpc.devops_vpc.id

  # Only postgres in
  ingress {
    from_port   = 0
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow all outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

#create the RDS instance
resource "aws_db_instance" "fp-rds" {
  allocated_storage           = 10
  storage_type                = "gp2"
  engine                      = "mysql"
  engine_version              = "5.7"
  instance_class              = "db.t3.micro"
  name                        = "hello_world"
  username                    = "webapp"
  password                    = "webpass123#"
  port                        = 3306
  vpc_security_group_ids      = [aws_security_group.rds-db-sg.id]
  parameter_group_name        = "default.mysql5.7"
  db_subnet_group_name        = aws_db_subnet_group.db-db-subnet.id
  publicly_accessible         = false
  allow_major_version_upgrade = false
  auto_minor_version_upgrade  = false
  apply_immediately           = true
  storage_encrypted           = false
}
