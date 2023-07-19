# ==========================================================================
#  EC2: output.tf
# --------------------------------------------------------------------------
#  Description:
#    Output Terraform Value
# --------------------------------------------------------------------------
#    - Instance ID
#    - Security Group ID
# ==========================================================================

output "instance_id" {
  description = "The ID of the created EC2 instance"
  value       = aws_instance.ec2.id
}

output "security_group_id" {
  description = "The ID of the created EC2 instance security group"
  value       = aws_security_group.selected.id
}

output "public_ip" {
  description = "The public ip EC2 instance"
  value       = aws_eip.ec2.public_ip
}

output "private_ip" {
  description = "The private ip EC2 instance"
  value       = aws_eip.ec2.private_ip
}