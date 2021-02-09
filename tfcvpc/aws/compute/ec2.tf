resource "aws_instance" "compEc2" {
  count                       = var.my_instance_count
  ami                         = var.my_instance_ami
  instance_type               = var.my_instance_type
  subnet_id                   = var.my_instance_subnet
  key_name                    = var.my_key
  associate_public_ip_address = var.pub_ip_req
}
