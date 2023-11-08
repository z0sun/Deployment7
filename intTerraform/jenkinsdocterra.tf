########## Provider ######
provider "aws" {
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  region     = "us-east-1"

}
######## INSTANCE ##############
resource "aws_instance" "Jenkins" {
  ami                         = "ami-0fc5d935ebf8bc3bc"
  instance_type               = "t2.medium"
  user_data                   = file("${path.module}/jenkinsman.sh")
  vpc_security_group_ids      = ["sg-0b89f7790d27b17b3"]
  availability_zone           = "us-east-1a"
  key_name                    = "JosephWhiteKey"
  associate_public_ip_address = true
  tags = {
    Name = "Jenkins"
  }
}

resource "aws_instance" "Docker_agent" {
  ami                         = "ami-0fc5d935ebf8bc3bc"
  instance_type               = "t2.medium"
  user_data                   = file("${path.module}/dockeragent.sh")
  vpc_security_group_ids      = ["sg-0b89f7790d27b17b3"]
  availability_zone           = "us-east-1a"
  key_name                    = "JosephWhiteKey"
  associate_public_ip_address = true
  tags = {
    Name = "Docker"
  }
}

resource "aws_instance" "Terraform_agent" {
  ami                         = "ami-0fc5d935ebf8bc3bc"
  instance_type               = "t2.medium"
  user_data                   = file("${path.module}/terraagent.sh")
  vpc_security_group_ids      = ["sg-0b89f7790d27b17b3"]
  availability_zone           = "us-east-1a"
  key_name                    = "JosephWhiteKey"
  associate_public_ip_address = true
  tags = {
    Name = "Terraform"
  }
}
