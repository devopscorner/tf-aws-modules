# ==========================================================================
#  ACM: output.tf
# --------------------------------------------------------------------------
#  Description:
#    Output Terraform Value
# --------------------------------------------------------------------------
#    - Certificate ARN
# ==========================================================================

output "certificate_arn" {
  description = "The ARN of the ACM certificate"
  value       = aws_acm_certificate.selected.arn
}