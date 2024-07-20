output "aws_vpc_block" {
  value = aws_vpc.terraform_vpc.cidr_block
}
output "aws_private_route" {
  value = aws_route_table.private_route.id
}
output "aws_public_route" {
  value = aws_route_table.public_route.id
}
output "aws_private_subnet" {
  value = aws_subnet.private_subnet.id
}

output "aws_public_subnet" {
  value = aws_subnet.public_subnet.id
}
output "security_group_private" {
  value = aws_security_group.terraform_sg_private.id
}
output "security_group_public" {
  value = aws_security_group.terraform_sg_public.id
}
output "ami_id" {
  value = data.aws_ami.ami_id.id
}
output "instance_private_0" {
  value = aws_instance.dynamic_device[0].private_ip
  sensitive = true
}
/* output "instance_private_1" {
  value = aws_instance.dynamic_device[1].private_ip
  sensitive = true
} */
output "instance_id" {
  value = aws_instance.dynamic_device[0].id
  sensitive = false
}
