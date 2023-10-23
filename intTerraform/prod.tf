
# VARIABLES
variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "ssh_key_name" {}
variable "region" {
  default = "us-east-1"
}
variable "vpc_cidr" {
  default = "172.16.0.0/16"
}
variable "sub1_cidr" {
  default = "172.16.0.0/18"
}

variable "sub2_cidr" {
  default = "172.16.128.0/18"
}

variable "pri_cidr" {
  default = "172.16.64.0/18"
}


# PROVIDER
provider "aws" {
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  region     = var.region
}

# VPC
resource "aws_vpc" "prob-vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = "true"

  tags = {
    Name = "VPC-PROB1"
  }

}

# # ELASTIC IP 
# resource "aws_eip" "nat_eip_prob" {
#   domain = "vpc"

# }

# # NAT GATEWAY 
# resource "aws_nat_gateway" "nat_gateway_prob" {
#   allocation_id = aws_eip.nat_eip_prob.id
#   subnet_id     = aws_subnet.subnet1.id
# }



# SUBNET 1
resource "aws_subnet" "subnet1" {
  cidr_block              = var.sub1_cidr
  vpc_id                  = aws_vpc.prob-vpc.id
  map_public_ip_on_launch = "true"
  availability_zone       = data.aws_availability_zones.available.names[1]
}

resource "aws_subnet" "subnet2" {
  cidr_block              = var.sub2_cidr
  vpc_id                  = aws_vpc.prob-vpc.id
  map_public_ip_on_launch = "true"
  availability_zone       = data.aws_availability_zones.available.names[2]
}

# SUBNET 2
resource "aws_subnet" "pri_subnet1" {
  cidr_block              = var.pri_cidr
  vpc_id                  = aws_vpc.prob-vpc.id
  map_public_ip_on_launch = "false"
  availability_zone       = data.aws_availability_zones.available.names[1]
}

# INTERNET GATEWAY
resource "aws_internet_gateway" "gw_1" {
  vpc_id = aws_vpc.prob-vpc.id
}

# ROUTE TABLE
resource "aws_route_table" "route_table1" {
  vpc_id = aws_vpc.prob-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw_1.id
  }
}

resource "aws_route_table_association" "route-subnet1" {
  subnet_id      = aws_subnet.subnet1.id
  route_table_id = aws_route_table.route_table1.id
}

resource "aws_route_table_association" "route-subnet2" {
  subnet_id      = aws_subnet.subnet2.id
  route_table_id = aws_route_table.route_table1.id
}

# PRIVATE ROUTE TABLE
resource "aws_route_table" "pri_route_table" {
  vpc_id = aws_vpc.prob-vpc.id

  # route {
  #   cidr_block     = "0.0.0.0/0"
  #   nat_gateway_id = aws_nat_gateway.nat_gateway_prob.id
  # }
}

resource "aws_route_table_association" "route-subnet3" {
  subnet_id      = aws_subnet.pri_subnet1.id
  route_table_id = aws_route_table.pri_route_table.id
}

# SEC GROUP
resource "aws_security_group" "prob_http" {
  name        = "prob_http"
  description = "Allow inbound ssh and http"
  vpc_id      = aws_vpc.prob-vpc.id

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
  ingress {
    from_port   = 8000
    to_port     = 8000
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
    "Name" : "Web server"
    "Terraform" : "true"
  }
}


# INSTANCE
resource "aws_instance" "prob_web" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.subnet1.id
  vpc_security_group_ids = [aws_security_group.prob_http.id]
  key_name               = "new"

  user_data = file("setup.sh")


  tags = {
    "Name" : "webserver001"
  }

}

resource "aws_instance" "prob_web2" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.subnet2.id
  vpc_security_group_ids = [aws_security_group.prob_http.id]
  key_name               = "new"

  user_data = file("setup.sh")


  tags = {
    "Name" : "webserver002"
  }

}

# DATA
data "aws_availability_zones" "available" {
  state = "available"
}

data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

# OUTPUT
output "instance-dns" {
  value = [aws_instance.prob_web2.public_ip, aws_instance.prob_web.public_ip]
}
