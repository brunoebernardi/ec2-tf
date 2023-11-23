#Show IP/DNS VALUES
output "aws_instance_public_dns" {
  value = "${aws_instance.windows.public_dns}"
}

output "aws_instance_public_ip" {
  value="${aws_instance.windows.public_ip}" 
}