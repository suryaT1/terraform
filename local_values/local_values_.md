use cases of local values :

local values has same as variables in terarform ,but we can write functions or expression on locals,
in variables we can't write any logics that's why locals has a vast scope in real time

syntax of locals :

locals {
 "local_name" = # 
 }

**Note **: In terraform we mention as locals in block but whenever we reference the locals we need to use **"local"** only.
Please refer below example

################################

locals {
  machine = ["first","second","third"]
}
resource "aws_instance" "multi_ec2" {
    ami = "123456"
   instance_type = "t2.micro"
   count = **length(local.machine)**  # length function obtains the numerical values , here values is 3
   tags = {
    Name = element(**local.machine**,count.index)
}
}

in the above example two times locals used **local**
