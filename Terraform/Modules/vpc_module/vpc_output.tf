output "vpc_id" {
    value = aws_vpc.vpc_resource.id
}
output "public_subnet_id" {
    value = aws_subnet.public_subnet_resource[0].id
}


output "vpc_public_subnet_ids" {
  value = aws_subnet.public_subnet_resource[*].id
}


output "vpc_public_subnet_az" {
  value = aws_subnet.public_subnet_resource[0].availability_zone
}