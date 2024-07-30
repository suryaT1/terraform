provider "aws" {                             #region
  region = "sa-east-1"
}

# Below lines are commeneted if we need to pass the public key 

/* resource "aws_key_pair" "test_terraform" {
  key_name = "test_terraform"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCfpGZULN9aBcRkvJP/PB3DIlvWdbe/GiOK3PEILPyM/9r/CGYvrSYcu6M0YOGwzu1O4+qQIgVOxgu6cI8nN3mvLWFo5Q+Z4nkJYJJsvhYWfvodIi25dfZNBTHxKvD1mmHG2YDQBlmhrQqQUVeTBE48brsnKjJ4U0DmksDiyGMGtvGt+TKvJqqItsPKi3aX/7u5D97ymnTuz68cWAIxZbM6NF9cQJb2lPQzLbSECx41xJQAYju2sTwgkRythinHUCIGHkI8wkxQ/NI09QYTWzVfuqCKZw+S8Iw7uQDN3XpAKv9SwhIFFaQhcSMIzeso66klUdzkkcHC39yOtyTx/j8h test_terraform"
} */

data "aws_key_pair" "test_terraform" {
  key_pair_id = "key-01b282c7682a93234"
}
resource "aws_instance" "ec2_machine" {
  instance_type = "t2.micro"
  ami = "ami-02031d73889932104"
  key_name = data.aws_key_pair.test_terraform.key_name
  tags = {
    Name = "production-server"
  }
}
resource "null_resource" "execute_script" {
  provisioner "remote-exec" {
    inline = [ "sudo yum install nginx" ]
  }
  connection {
    type = "ssh"
    user = "ec2-user"
    private_key = file("../test_terraform")
    host = aws_instance.ec2_machine.public_ip
  } 
}
