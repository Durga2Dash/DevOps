resource "aws_vpc" "my_vpc" {
  cidr_block       = var.my_vpc_cidr
  instance_tenancy = var.my_tenancy
}

resource "aws_subnet" "my_vpc_subnet" {
  vpc_id     = var.my_vpc_id
  cidr_block = var.my_subnet_cidr
}

output "my_vpc_id1" {
  value = aws_vpc.my_vpc.id
}

output "my_subnet_id1" {
  value = aws_subnet.my_vpc_subnet.id
}
