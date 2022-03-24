terraform{
    backend "s3"{
        bucket = "mybheem"
        key = "VPC/terraform.tfstate"
        region = "us-west-2"
    }
}
