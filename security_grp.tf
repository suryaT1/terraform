resource "aws_security_group" "terraform_sg" {
    description = " this group has created using terraform"
    tags ={
        Name = "terraform_sg"
    }
}
resource "aws_vpc_security_group_ingress_rule" "inbound" {
    security_group_id = aws_security_group.terraform_sg.id
    ip_protocol = "tcp"
    to_port = 22
    from_port = 22
    cidr_ipv4 = "0.0.0.0/0"
    tags= {
        Name= "inbound "
    }
}
resource "aws_vpc_security_group_egress_rule" "outbound" {
    security_group_id = aws_security_group.terraform_sg.id
    ip_protocol = "-1"
    cidr_ipv4 = "0.0.0.0/0"
  tags= {
        Name= "Outbound "
    }

}
