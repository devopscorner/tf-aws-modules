# ==========================================================================
#  EC2: output.tf
# --------------------------------------------------------------------------
#  Description:
#    Output Terraform Value
# --------------------------------------------------------------------------
#    - Instance ID
#    - Security Group ID
#    - Auto Scaling Group Name
#    - Auto Scaling Group ARN
# ==========================================================================

output "instance_id" {
  description = "The ID of the created EC2 instance"
  value       = aws_autoscaling_group.selected.id
}

output "security_group_id" {
  description = "The ID of the created EC2 instance security group"
  value       = aws_security_group.selected.id
}

output "public_ip" {
  value = aws_eip.ec2.public_ip
}

output "private_ip" {
  value = aws_eip.ec2.private_ip
}

output "autoscaling_group_name" {
  description = "The name of the Autoscaling Group"
  value       = aws_autoscaling_group.selected.name
}

output "autoscaling_group_arn" {
  description = "The ARN of the Autoscaling Group"
  value       = aws_autoscaling_group.selected.arn
}
