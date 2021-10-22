variable "project_name" {
  description = "Project Name - will prefex all generated AWS resource names"
  default     = "devops-sg"
}

provider "aws" {
  shared_credentials_file = "C:/Users/Wireless-Lala/.aws/credentials"
  profile                 = "defult"
  region                  = "eu-west-2"

}


variable "AmazonEC2FullAccess_arn" {}

variable "AmazonS3FullAccess_arn" {}


variable "AmazonRDSFullAccess_arn" {}
