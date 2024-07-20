 data "aws_ami" "ami_id" {
  most_recent = true
  owners = [ "amazon" ]
  filter {
    name = "name"
    values = [ "al2023-ami-2023.5.20240708.0-kernel-6.1-x*" ]
  }
}
resource "aws_instance" "dynamic_device" {
    availability_zone = null
  count = 1
  ami = data.aws_ami.ami_id.id
  instance_type = "t2.micro"
  tags = {
    Name = "dynamic-device-${count.index}"
  }
  security_groups = [aws_security_group.terraform_sg_public.id]
  subnet_id = aws_subnet.public_subnet.id
}
