#Set keypair and vinculate to VPC
resource "aws_key_pair" "key" {
  key_name   = "ec2_ubuntu_key"
  public_key = file(var.pub_key)
}

resource "aws_default_vpc" "ec2-unix-vpc" {

}