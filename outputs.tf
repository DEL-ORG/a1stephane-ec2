# outputs.tf
output "instance_id" {
  description = "ID of the created EC2 instance"
  value       = aws_instance.ec2.id
}

output "instance_public_ip" {
  description = "Public IP address of the created EC2 instance"
  value       = aws_instance.ec2.public_ip
}


output "eip_address" {
  description = "Elastic IP address of the instance"
  value       = aws_eip.eip.public_ip
}