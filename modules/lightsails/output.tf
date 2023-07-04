# ==========================================================================
#  Lightsails: output.tf
# --------------------------------------------------------------------------
#  Description:
#    Output Terraform Value
# --------------------------------------------------------------------------
#    - Instance ID
# ==========================================================================

output "instance_id" {
  description = "The ID of the Lightsail instance"
  value       = aws_lightsail_instance.example.id
}