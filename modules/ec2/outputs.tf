output "instance_public_ip" {
  description = "The public IP address of the EC2 instance"
  value       = aws_instance.main.public_ip
}

output "instance_id" {
  description = "The ID of the EC2 instance"
  value       = aws_instance.main.id
}

output "instance_private_ip" {
  description = "The private IP address of the EC2 instance"
  value       = aws_instance.main.private_ip
}

output "instance_availability_zone" {
  description = "The availability zone of the EC2 instance"
  value       = aws_instance.main.availability_zone
}
