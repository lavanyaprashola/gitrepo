terraform{
    backend "s3"{
        bucket = "myprashola"
        key = "VPC/terraform.tfstate"
        region = "us-east-1"
    }
}
