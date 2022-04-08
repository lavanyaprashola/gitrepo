provider "aws" {
  region = var.region
}

# data "aws_subnet" "subnet" {

#   filter {
#     name   = "tag:Name"
#     values = ["pub-*"]
#   }
# }

# data "aws_vpc" "test-vpc" {

#     filter {
#       name   = "tag:Name"
#       values = ["test-*"]
#     }
# }

resource "aws_security_group" "test-sg" {
  name        = "test-sgp"
  description = "Security group"
  vpc_id      = "vpc-06a1a6cd545cf7522"

  ingress {
    description      = "TLS from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

ingress {
    description      = "TLS from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "test-sgp"
  }
}



resource "aws_instance" "test-ins" {
  ami = var.ami
  instance_type = var.instance_type
  key_name = var.key_name
  subnet_id = "subnet-026bc4bc1240bdad6"
}
