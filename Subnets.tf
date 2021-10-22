
resource "aws_subnet" "devops-pub-1a" {
  vpc_id            = aws_vpc.devops_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "eu-west-2a"

  tags = {
    Name = "devops_public_subnet_1a"
  }
}

resource "aws_subnet" "devops-pub-1b" {
  vpc_id            = aws_vpc.devops_vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "eu-west-2b"

  tags = {
    Name = "devops_public_subnet_1b"
  }
}

resource "aws_subnet" "devops-prv-1a" {
  vpc_id            = aws_vpc.devops_vpc.id
  cidr_block        = "10.0.4.0/24"
  availability_zone = "eu-west-2a"

  tags = {
    Name = "devops_private_subnet_1a"
  }
}



resource "aws_subnet" "devops-pub-1c" {
  vpc_id            = aws_vpc.devops_vpc.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = "eu-west-2c"

  tags = {
    Name = "devops_public_subnet_1c"
  }
}


#DB Subnet

# create db subnet group
resource "aws_db_subnet_group" "db-db-subnet" {
  name = "sql-db-subnet-group"
  subnet_ids = [aws_subnet.devops-pub-1b.id,
  aws_subnet.devops-prv-1a.id, ]
  tags = {
    Name = "flask-sql-db-subnet"
  }
}
