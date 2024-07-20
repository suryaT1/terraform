variable "eu-west-1" { #variable for region
  default = "eu-west-1"
}
variable "eu-east-1" { #variable for region
  default = "eu-east-1"
}
variable "sa-east-1" { #variable for region
  default = "sa-east-1"
}
variable "vpc_block" {
  default = "11.11.0.0/16"
}
variable "security_ports_private" { #variable for private security group ports
  type    = list(any)
  default = ["22","80"]
}

variable "security_ports_public" { #variable for public security group ports
  type    = list(any)
  default = ["21","22","8080"]
}
variable "private_route" {   #variable for private route
  default = "11.11.1.0/24"
}

variable "public_route" {   #variable for public route
  default = "11.11.2.0/24"
}
