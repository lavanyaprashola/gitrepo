output "VPC_Id" {
    value = aws_vpc.test-vpc.id
}

output "pub-subnet-id" {
    value = aws_subnet.test-pub-sub.id
}