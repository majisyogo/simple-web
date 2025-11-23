#1.【Select Region】
provider "aws" {
  region = "ap-northeast-1"
}

# 2.【Get the latest AMI】

##2-1.Check AMI ID
data "aws_ssm_parameter" "amazon_linux" {
  name = "/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2"
}　

#data block=I can get existing resources or external information.
#aws_ssm_parameter=I can retrieve information stored in SSM Parameters.
#Ex: AMI ID="ami-0abcdef1234567890"

##2-2.Display the AMI ID
output "latest_amazon_linux_ami" {
  value = data.aws_ssm_parameter.amazon_linux.value
} 
#I can check AMI ID. Ex: AMI ID="ami-0abcdef1234567890"


#3.【Create EC2】
variable "instance_type" {
  default = "t3.micro"
}

variable "instance_name" {
  default = "SimpleWebServer"
}

resource "aws_instance" "simple_web" {
  ami           = data.aws_ssm_parameter.amazon_linux.value
  instance_type = var.instance_type

  tags = {
    Name = var.instance_name
  }
}
#I can enter any name as a tag name.
