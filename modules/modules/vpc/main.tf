provider "aws" {
  region = "sa-east-1"
}
resource "aws_vpc" "module_vpc" {
  cidr_block = "10.10.0.0/16"
  tags = {
    Name = "module_vpc"
  }
}
variable "inbound" {   #provide port valuesrequired based on the project - inbound
  type = list
  default = ["22"]  # always list 
}
variable "outbound" {    #provide port valuesrequired based on the project - outbound
  type = list
  default = ["8080"]   # always list 
}
resource "aws_security_group" "module_sg" {
  vpc_id = aws_vpc.module_vpc.id    # assigning vpc id to security group
  tags = {
    Name = "module_sg"
  }
  dynamic "ingress" {           # creating inbound rules to SG
    for_each = tolist(var.inbound)
    iterator = port
    content {
        cidr_blocks = ["0.0.0.0/0"]
        to_port = port.value
        from_port = port.value
        protocol = "tcp"
    }
  }
  dynamic "egress" {          # creating outbound rules to SG
    for_each = tolist(var.outbound)
    iterator = port
    content {
        cidr_blocks = ["0.0.0.0/0"]
        to_port = port.value
        from_port = port.value
        protocol = "tcp"
    }
  }
}
resource "aws_subnet" "module_subnet" {       # creating subnet to vpc
  vpc_id                  = aws_vpc.module_vpc.id
  cidr_block              = "10.10.1.0/24"
  availability_zone       = "sa-east-1a"
  map_public_ip_on_launch = true
  tags = {
    Name = "module_subnet"
  }
}
output "module_subnet" {                   #fetching output for reusing the value in child module
  value = aws_subnet.module_subnet.id
}
output "security_group" {                #fetching output for reusing the value in child module
  value = aws_security_group.module_sg.id
}
