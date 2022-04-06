terraform {
  backend "s3" {
    bucket = "myprashola"
    region = "us-east-1"
    key = "ec2/terraform.tfstate"
  }
}