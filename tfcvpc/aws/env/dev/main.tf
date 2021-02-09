provider "aws" {
  region = "us-east-2"
}
module "net" {
  source         = "../../networking"
  my_vpc_cidr    = "192.168.0.0/16"
  my_tenancy     = "default"
  my_subnet_cidr = "192.168.1.0/24"
  my_vpc_id      = module.net.my_vpc_id1
}

#module "ec2" {
#  source             = "../../compute"
#  my_instance_count  = "1"
#  my_instance_type   = "t2.micro"
#  my_instance_ami    = "ami-0ebc8f6f580a04647"
#  my_instance_subnet = module.net.my_subnet_id1
#  my_key             = "terraform_key"
#  pub_ip_req         = "true"
#}
