output "vpc_id" {
  value = aws_vpc.wordpress-vpc.id
}

output "public_subnet_id" {
  value = aws_subnet.public_subnet["us-east-1a"].id
}

output "private_subnet_ids" {
  value = [
    aws_subnet.private_subnet["us-east-1a"].id,
    aws_subnet.private_subnet["us-east-1b"].id,
    aws_subnet.private_subnet["us-east-1c"].id
  ]
}






