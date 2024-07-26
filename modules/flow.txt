PS C:\Users\Desktop\Desktop\Terraform\modules_new\projects\machine> terraform apply -auto-approve
module.ec2_instance.module.aws_ami.data.aws_ami.ami_fetch: Reading...
module.ec2_instance.module.aws_ami.data.aws_ami.ami_fetch: Read complete after 1s [id=ami-09fa7d8fb87523293]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # module.ec2_instance.aws_instance.ec2_instance_new will be created
  + resource "aws_instance" "ec2_instance_new" {
      + ami                                  = "ami-09fa7d8fb87523293"
      + arn                                  = (known after apply)
      + associate_public_ip_address          = (known after apply)
      + availability_zone                    = (known after apply)
      + cpu_core_count                       = (known after apply)
      + cpu_threads_per_core                 = (known after apply)
      + disable_api_stop                     = (known after apply)
      + disable_api_termination              = (known after apply)
      + ebs_optimized                        = (known after apply)
      + get_password_data                    = false
      + host_id                              = (known after apply)
      + host_resource_group_arn              = (known after apply)
      + iam_instance_profile                 = (known after apply)
      + id                                   = (known after apply)
      + instance_initiated_shutdown_behavior = (known after apply)
      + instance_lifecycle                   = (known after apply)
      + instance_state                       = (known after apply)
      + instance_type                        = "t2.micro"
      + ipv6_address_count                   = (known after apply)
      + ipv6_addresses                       = (known after apply)
      + key_name                             = "test_terraform"
      + monitoring                           = (known after apply)
      + outpost_arn                          = (known after apply)
      + password_data                        = (known after apply)
      + placement_group                      = (known after apply)
      + placement_partition_number           = (known after apply)
      + primary_network_interface_id         = (known after apply)
      + private_dns                          = (known after apply)
      + private_ip                           = (known after apply)
      + public_dns                           = (known after apply)
      + public_ip                            = (known after apply)
      + secondary_private_ips                = (known after apply)
      + security_groups                      = (known after apply)
      + source_dest_check                    = true
      + spot_instance_request_id             = (known after apply)
      + subnet_id                            = (known after apply)
      + tags                                 = {
          + "Name" = "machine-module"
        }
      + tags_all                             = {
          + "Name" = "machine-module"
        }
      + tenancy                              = (known after apply)
      + user_data                            = (known after apply)
      + user_data_base64                     = (known after apply)
      + user_data_replace_on_change          = false
      + vpc_security_group_ids               = (known after apply)

      + capacity_reservation_specification (known after apply)

      + cpu_options (known after apply)

      + ebs_block_device (known after apply)

      + enclave_options (known after apply)

      + ephemeral_block_device (known after apply)

      + instance_market_options (known after apply)

      + maintenance_options (known after apply)

      + metadata_options (known after apply)

      + network_interface (known after apply)

      + private_dns_name_options (known after apply)

      + root_block_device (known after apply)
    }

  # module.ec2_instance.module.module_vpc.aws_security_group.module_sg will be created
  + resource "aws_security_group" "module_sg" {
      + arn                    = (known after apply)
      + description            = "Managed by Terraform"
      + egress                 = [
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + from_port        = 22
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = []
              + self             = false
              + to_port          = 22
                # (1 unchanged attribute hidden)
            },
        ]
      + id                     = (known after apply)
      + ingress                = [
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + from_port        = 22
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = []
              + self             = false
              + to_port          = 22
                # (1 unchanged attribute hidden)
            },
        ]
      + name                   = (known after apply)
      + name_prefix            = (known after apply)
      + owner_id               = (known after apply)
      + revoke_rules_on_delete = false
      + tags                   = {
          + "Name" = "module_sg"
        }
      + tags_all               = {
          + "Name" = "module_sg"
        }
      + vpc_id                 = (known after apply)
    }

  # module.ec2_instance.module.module_vpc.aws_subnet.module_subnet will be created
  + resource "aws_subnet" "module_subnet" {
      + arn                                            = (known after apply)
      + assign_ipv6_address_on_creation                = false
      + availability_zone                              = "sa-east-1a"
      + availability_zone_id                           = (known after apply)
      + cidr_block                                     = "10.10.1.0/24"
      + enable_dns64                                   = false
      + enable_resource_name_dns_a_record_on_launch    = false
      + enable_resource_name_dns_aaaa_record_on_launch = false
      + id                                             = (known after apply)
      + ipv6_cidr_block_association_id                 = (known after apply)
      + ipv6_native                                    = false
      + map_public_ip_on_launch                        = true
      + owner_id                                       = (known after apply)
      + private_dns_hostname_type_on_launch            = (known after apply)
      + tags                                           = {
          + "Name" = "module_subnet"
        }
      + tags_all                                       = {
          + "Name" = "module_subnet"
        }
      + vpc_id                                         = (known after apply)
    }

  # module.ec2_instance.module.module_vpc.aws_vpc.module_vpc will be created
  + resource "aws_vpc" "module_vpc" {
      + arn                                  = (known after apply)
      + cidr_block                           = "10.10.0.0/16"
      + default_network_acl_id               = (known after apply)
      + default_route_table_id               = (known after apply)
      + default_security_group_id            = (known after apply)
      + dhcp_options_id                      = (known after apply)
      + enable_dns_hostnames                 = (known after apply)
      + enable_dns_support                   = true
      + enable_network_address_usage_metrics = (known after apply)
      + id                                   = (known after apply)
      + instance_tenancy                     = "default"
      + ipv6_cidr_block                      = (known after apply)
      + ipv6_cidr_block_network_border_group = (known after apply)
      + main_route_table_id                  = (known after apply)
      + owner_id                             = (known after apply)
      + tags                                 = {
          + "Name" = "module_vpc"
        }
      + tags_all                             = {
          + "Name" = "module_vpc"
        }
    }

Plan: 4 to add, 0 to change, 0 to destroy.
module.ec2_instance.module.module_vpc.aws_vpc.module_vpc: Creating...
module.ec2_instance.module.module_vpc.aws_vpc.module_vpc: Creation complete after 6s [id=vpc-076a79c97e59242a4]
module.ec2_instance.module.module_vpc.aws_subnet.module_subnet: Creating...
module.ec2_instance.module.module_vpc.aws_security_group.module_sg: Creating...
module.ec2_instance.module.module_vpc.aws_security_group.module_sg: Creation complete after 7s [id=sg-062d5980ad3d38b2d]
module.ec2_instance.module.module_vpc.aws_subnet.module_subnet: Still creating... [10s elapsed]
module.ec2_instance.module.module_vpc.aws_subnet.module_subnet: Creation complete after 13s [id=subnet-03ddd88cd648e1661]
module.ec2_instance.aws_instance.ec2_instance_new: Creating...
module.ec2_instance.aws_instance.ec2_instance_new: Still creating... [10s elapsed]
module.ec2_instance.aws_instance.ec2_instance_new: Still creating... [20s elapsed]
module.ec2_instance.aws_instance.ec2_instance_new: Still creating... [30s elapsed]
module.ec2_instance.aws_instance.ec2_instance_new: Creation complete after 39s [id=i-063a85ab8c51bd409]

Apply complete! Resources: 4 added, 0 changed, 0 destroyed.
PS C:\Users\Desktop\Desktop\Terraform\modules_new\projects\machine> terraform destroy -auto-approve
module.ec2_instance.module.module_vpc.aws_vpc.module_vpc: Refreshing state... [id=vpc-076a79c97e59242a4]
module.ec2_instance.module.aws_ami.data.aws_ami.ami_fetch: Reading...
module.ec2_instance.module.aws_ami.data.aws_ami.ami_fetch: Read complete after 2s [id=ami-09fa7d8fb87523293]
module.ec2_instance.module.module_vpc.aws_subnet.module_subnet: Refreshing state... [id=subnet-03ddd88cd648e1661]
module.ec2_instance.module.module_vpc.aws_security_group.module_sg: Refreshing state... [id=sg-062d5980ad3d38b2d]
module.ec2_instance.aws_instance.ec2_instance_new: Refreshing state... [id=i-063a85ab8c51bd409]
