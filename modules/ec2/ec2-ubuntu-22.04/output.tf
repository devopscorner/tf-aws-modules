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
  value       = aws_autoscaling_group.selected.id
}

output "security_group_id" {
  description = "The ID of the created EC2 instance security group"
  value       = aws_security_group.selected.id
}
