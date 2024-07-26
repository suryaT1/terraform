provider "aws" {
  region = "sa-east-1"    #aws region 
}
module "aws_ami" {    # calling ami module to get the AMI ID
  source = "../ami"
}
module "module_vpc" { # calling vpc module to get the details
  source = "../vpc"
}
resource "aws_instance" "ec2_instance_new" {
  ami = module.aws_ami.ami_id  # assign the value
  instance_type = "t2.micro"
  key_name = "test_terraform"  # keys updated
  vpc_security_group_ids = [ module.module_vpc.security_group ] #security group assigned
  subnet_id = module.module_vpc.module_subnet  # updated subnet group
  tags = {
    Name = "machine-module"
  }
}
output "ec2_instance" {
  value = aws_instance.ec2_instance_new.public_ip    #fetching the output value
}
