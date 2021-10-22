resource "aws_iam_role" "devops_ec2_role" {
  name = "devops2_ec2_role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF

  tags = {
    Name = "devops_ec2_role"
  }

}




resource "aws_iam_role_policy_attachment" "ec2_s3fullaccess_attach" {
  role       = aws_iam_role.devops_ec2_role.name
  policy_arn = var.AmazonS3FullAccess_arn
}

resource "aws_iam_role_policy_attachment" "ec2_RDSfullaccess_attach" {
  role       = aws_iam_role.devops_ec2_role.name
  policy_arn = var.AmazonRDSFullAccess_arn
}

resource "aws_iam_instance_profile" "ec2_instance_profile" {
  name = "ec2_instance_profile"
  role = aws_iam_role.devops_ec2_role.name
}
