resource "aws_security_group" "asg_web_sg" {
  name        = "asg_web_sg"
  description = "Allow HTTP inbound connections"
  vpc_id      = aws_vpc.devops_vpc.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "devops_SG_Web_Security_Group"
  }
}


resource "aws_launch_configuration" "web_launch_conf" {
  name_prefix                 = "devops-"
  image_id                    = "ami-09a56048b08f94cdf"
  iam_instance_profile        = aws_iam_instance_profile.ec2_instance_profile.name
  instance_type               = "t2.micro"
  key_name                    = "Lateef"
  security_groups             = [aws_security_group.asg_web_sg.id]
  associate_public_ip_address = true


  lifecycle {
    create_before_destroy = true
  }
}

