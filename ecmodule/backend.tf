terraform {
  backend "s3" {
    bucket = "mybheem"
    region = "us-east-1"
    key = "ec2/terraform.tfstate"
  }
}
