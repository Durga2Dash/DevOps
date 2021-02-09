variable "my_vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "my_tenancy" {
  default = "dedicated"
}

# If the value has to be supplied mandatorily by the user don't keep default inside variable

variable "my_subnet_cidr" {
  default = "10.0.1.0/24"
}

variable "my_vpc_id" {}
