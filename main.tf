provider "aws" {
  region = "ap-northeast-1"
}

# 最新 Amazon Linux 2 AMI を取得
data "aws_ssm_parameter" "amazon_linux" {
  name = "/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2"
}

resource "aws_instance" "simple_web" {
  ami           = data.aws_ssm_parameter.amazon_linux.value
  instance_type = "t3.micro"

  tags = {
    Name = "SimpleWebServer"
  }
}
