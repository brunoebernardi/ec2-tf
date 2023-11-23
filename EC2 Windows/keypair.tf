#Set keypair and vinculate to VPC
resource "aws_key_pair" "key" {
  key_name   = "ec2_windows_key"
  public_key = file(var.pub_key)
}

resource "aws_default_vpc" "ec2-windows-vpc" {

}