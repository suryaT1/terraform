
provider "aws" {
  region = var.sa-east-1
} # mention the location which you want based on the providers.tf

# terraform_vpc is the local name for this VPC 
resource "aws_vpc" "terraform_vpc" { 
  cidr_block = var.vpc_block
  tags = {
    Name = "terraform_vpc"
  }
}
#creating route table - public

resource "aws_route_table" "public_route" {
  vpc_id = aws_vpc.terraform_vpc.id
  lifecycle {
    ignore_changes = all
  }
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.terraform_igw.id
  }
  tags = {
    Name = "public_roue_table"
  }
}

# assigning route table to subnet

resource "aws_route_table_association" "public_rt_subnet" {
  route_table_id = aws_route_table.public_route.id
  subnet_id = aws_subnet.public_subnet.id
}

#Creating private route table - private

resource "aws_route_table" "private_route" {
  vpc_id = aws_vpc.terraform_vpc.id
  tags = {
    Name = "private_route_table"
  }
}
# assigning route table to subnet - private

resource "aws_route_table_association" "private_rt_subnet" {
  route_table_id = aws_route_table.private_route.id
  subnet_id = aws_subnet.private_subnet.id
}

#creating private subnet and assigned to vpc
resource "aws_subnet" "private_subnet" {
  vpc_id = aws_vpc.terraform_vpc.id
  cidr_block = var.private_route
  tags = {
    Name = "private_subnet - ${aws_vpc.terraform_vpc.id}"
  }

}
#creating public subnet and assigned to vpc

resource "aws_subnet" "public_subnet" {
  vpc_id = aws_vpc.terraform_vpc.id
  cidr_block = var.public_route
  tags = {
    Name = "public_subnet - ${aws_vpc.terraform_vpc.id}"
  }
  map_public_ip_on_launch = false
  lifecycle {
    ignore_changes = all
  }
}
#create internet gateway and assigned to VPC
resource "aws_internet_gateway" "terraform_igw" {
  vpc_id = aws_vpc.terraform_vpc.id
  tags = {
    Name = "terraform_igw"
  }
}
#creating security group for private
resource "aws_security_group" "terraform_sg_private" {
  vpc_id      = aws_vpc.terraform_vpc.id
  description = "creates new sg group for ${aws_vpc.terraform_vpc.id}"
  tags = {
    Name = "terraform_sg_private"
  }
  dynamic "ingress" {
    for_each = var.security_ports_private
    iterator = port_value
    content {
      cidr_blocks = [var.private_route]
      to_port     = port_value.value
      from_port   = port_value.value
      protocol    = "tcp"
    }
  }
}
#creating security group for public -inbound
resource "aws_security_group" "terraform_sg_public" {
  vpc_id      = aws_vpc.terraform_vpc.id
  description = "creates new sg group for ${aws_vpc.terraform_vpc.id}"
  tags = {
    Name = "terraform_sg_public"
  }
  dynamic "ingress" {
    for_each = var.security_ports_public
    iterator = port_value
    content {
      cidr_blocks = ["0.0.0.0/0"]
      to_port     = port_value.value
      from_port   = port_value.value
      protocol    = "tcp"
    }
  }
}
#defing public -security group and assigned to public security group - allow all
resource "aws_vpc_security_group_egress_rule" "outbound" {
  security_group_id = aws_security_group.terraform_sg_public.id
  cidr_ipv4 = "0.0.0.0/0"
  ip_protocol = "-1"
  tags = {
    Name = "allow-all"
  }
}
