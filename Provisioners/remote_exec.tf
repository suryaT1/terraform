provider "aws" {                             #region
  region = "sa-east-1"
}

#if want to create new key please use this block  #

/* resource "aws_key_pair" "test_terraform" {
  key_name = "test_terraform"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCfpGZULN9aBcRkvJP/PB3DIlvWdbe/GiOK3PEILPyM/9r/CGYvrSYcu6M0YOGwzu1O4+qQIgVOxgu6cI8nN3mvLWFo5Q+Z4nkJYJJsvhYWfvodIi25dfZNBTHxKvD1mmHG2YDQBlmhrQqQUVeTBE48brsnKjJ4U0DmksDiyGMGtvGt+TKvJqqItsPKi3aX/7u5D97ymnTuz68cWAIxZbM6NF9cQJb2lPQzLbSECx41xJQAYju2sTwgkRythinHUCIGHkI8wkxQ/NI09QYTWzVfuqCKZw+S8Iw7uQDN3XpAKv9SwhIFFaQhcSMIzeso66klUdzkkcHC39yOtyTx/j8h test_terraform"
} */

data "aws_key_pair" "test_terraform" {       #calling existed key pair which is available on aws 
  key_pair_id = "key-01b282c7682a93234"
}
resource "aws_instance" "ec2_machine" {
  instance_type = "t2.micro"
  ami = "ami-02031d73889932104"
  key_name = data.aws_key_pair.test_terraform.key_name    #referring key pair from data block.
  tags = {
    Name = "production-server"
  }
}
resource "null_resource" "execute_script" {    #null_resource is required when you want to perform provisioners if the instance got already created.
  provisioner "remote-exec" {
    inline = [ "sudo yum install nginx" ]    # installing nginx on remote server
  }
  connection {
    type = "ssh"
    user = "ec2-user"
    private_key = file("../test_terraform")   # please make sure path is correct or not
    host = aws_instance.ec2_machine.public_ip  #using public IP to connect
  }  
}
