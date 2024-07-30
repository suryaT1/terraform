provider "aws" {
  region = "sa-east-1"
}
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
provisioner "file" {
  source = "script.txt"  #local machine source details
  destination = "/tmp/test_terraform"  #remote machine destination
}
connection {
  type = "ssh"
  user = "ec2-user"
  host = self.public_ip  #self is a local resource
  private_key = file("script.txt")  #calling local file private key
}
}


/* 
output :
aws_instance.ec2_machine: Provisioning with 'file'...
aws_instance.ec2_machine: Still creating... [40s elapsed]
aws_instance.ec2_machine: Creation complete after 42s [id=i-01e72a62cf3e3b1b9]
*/
