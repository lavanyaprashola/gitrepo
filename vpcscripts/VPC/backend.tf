terraform{
    backend "s3"{
        bucket = "myprashola"
        key = "VPC/terraform.tfstate"
        region = "us-west-2"
    }
}
