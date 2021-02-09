variable "my_instance_count" {
  default = "1"
}

variable "my_instance_type" {
  default = "t2.micro"
}

# Mandatory variables passed during execution

variable "my_instance_ami" {}

variable "my_instance_subnet" {}

variable "my_key" {}

variable "pub_ip_req" {}
