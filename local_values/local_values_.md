use cases of local values :

local values has same as variables in terarform ,but we can write functions or expression on locals,
in variables we can't write any logics that's why locals has a vast scope in real time

syntax of locals :

locals {
 "local_name" = # 
 }

**Note **: In terraform we mention as locals in block but whenever we reference the locals we need to use **"local"** only.
Please refer below example

#############################
'''
locals {
  environment = "production"
  instance_type = local.environment == "production" ? "m5.large" : "t2.micro"
}

resource "aws_instance" "example" {
  ami           = "ami-123456"
  instance_type = local.instance_type
}
'''

in the above example two times locals used **local**
