#Select Region
provider "aws" {
  region = "ap-northeast-1"
}

# Get the latest AMI
data "aws_ssm_parameter" "amazon_linux" {
  name = "/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2"
}

#Create EC2
resource "aws_instance" "simple_web" {
  ami           = data.aws_ssm_parameter.amazon_linux.value
  instance_type = "t3.micro"　#I can chose an instance type.

  tags = {
    Name = "SimpleWebServer"
  } #I can enter any name as a tag name.
}
