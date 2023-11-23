#Create Role for EC2 Node
resource "aws_iam_role" "node" {
  name = "ec2-node"
   assume_role_policy = <<POLICY
{
   "Version": "2012-10-17",
   "Statement": [
     {
       "Effect": "Allow",
       "Principal": {
         "Service": "ec2.amazonaws.com"
       },
       "Action": "sts:AssumeRole"
     }
   ]
}
   POLICY
}
#CREATE EC2 INSTANCE
resource "aws_instance" "windows" {
  ami           = var.windows_ami
  instance_type = "t2.large"
  associate_public_ip_address = true
  key_name  = aws_key_pair.key.key_name
  vpc_security_group_ids = [aws_security_group.allow-access.id]
  subnet_id     = aws_subnet.subnet.id

  tags = {
    Name = "WINDOWS CUSTOM TAG"
} 

}
