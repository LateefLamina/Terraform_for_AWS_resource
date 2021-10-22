variable "project_name" {
  description = "Project Name - will prefex all generated AWS resource names"
  default     = "devops-sg"
}

provider "aws" {
  
    #  shared_credentials_file = "~/.aws/credentials"
  #  shared_credentials_file = "%USERPROFILE%\.aws\credentials"
  /*
      Shared credential files is a text file with the following format:
        [<PROFILE>]
        aws_access_key_id = <ACCESS_KEY_ID>
        aws_secret_access_key = <SECRET_ACCESS_KEY
  */
  shared_credentials_file = ""
  profile                 = "default"
  region                  = ""

}



variable "AmazonRDSFullAccess_arn" {}
