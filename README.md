# task2-Complete

1. VPC in ap-southeast-1 Region (you can choose any region that you like)
2. 3 Subnets in 3 different availability zones
3. Route table
4. Launch configuration
5. Autoscaling group
6. 3 EC2 instances (application servers) with code deploy agents installed
7. An Application load balancer to load-balance the application servers




---
## 2. Create terraform.tfvars
---

We need values that correspond with the ones defined in ```variables.tf```. You will need to create terraform.tfvars for your own variables. For example, ARN of your AWS EC2 Full access role - which is specific to your AWS environment, and can be considered sensitive for public sharing as well. 

I didn't include mine in this repo for the obvious reasons, and that's why you will need to create one yourself, and place it in the same directory as the rest of terraform scripts. 

``` bash
touch terraform.tfvars

```

In the file, you will need create the following values that correspond with variables in the ```variables.tf``` file. Take note of required AWS-managed policy ARNs in your AWS accounts



### terraform.tfvars

``` bash

AmazonEC2FullAccess_arn = "Your Value" 
AmazonS3FullAccess_arn = "Your Value"
key_name = "Your Value"


```

You will need to ***carefully*** consider the followings for ```terraform.tfvars``` file:


* AmazonS3FullAccess_arn: Update this with the ARN of AWSCodedeployRole policy in your AWS account. This may or may not be necessary. If your source code is on a private S3 bucket of your own, just create an IAM policy which allows access to that particular S3 bucket, and source code object (zip). 

* key_name: Update this with your EC2 SSH Keys


> Note: Ec2 and S3 FullAccess policies SHOULD ONLY BE USED FOR DEMO ENVIRONMENT ONLY! You should always use granular policies in production environment. 

---
## 3. Create your AWS environment with Terraform

Finally, To execute the terraform script, just do the following:

```bash
	terraform init 
  terraform plan #(And check if the plan works out for you) 
  terraform apply #Enter "yes" to confirm
