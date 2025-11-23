# Launch-EC2

##【Project Overview】
Set up an EC2 instance with Terraform.

##【Architecture】
- Terraform provisions a single EC2 instance.
- AMI is automatically obtained from AWS SSM Parameter Store.
- Instance type and tags are parameterized for flexibility.

##【What I Learned】
- I cannot launch an EC2 instance without a valid AMI ID.
- AMI IDs differ by region, so specifying the correct region is important.
- Using Terraform `data "aws_ssm_parameter"` allows automatic retrieval of the latest AMI, preventing failures from outdated IDs.
- Variables make instance type and tag name reusable and adaptable across environments.
- Output blocks help verify the obtained AMI ID and improve transparency during provisioning.
