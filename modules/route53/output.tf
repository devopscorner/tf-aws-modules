# ==========================================================================
#  Route53: output.tf
# --------------------------------------------------------------------------
#  Description:
#    Output Terraform Value
# --------------------------------------------------------------------------
#    - Zone ID
#    - Record Name
# ==========================================================================

output "route53_zone_id" {
  description = "The ID of the created Route53 zone"
  value       = aws_route53_zone.selected.zone_id
}

output "route53_record_name" {
  description = "The name of the created Route53 record"
  value       = aws_route53_record.selected.name
}
