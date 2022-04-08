terraform {
  backend "s3" {
    bucket = "bucketadmin"
    region = "us-west-2"
    key = "ec2/terraform.tfstate"
  }
}
