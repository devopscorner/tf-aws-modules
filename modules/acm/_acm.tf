# ==========================================================================
#  ACM: _acm.tf
# --------------------------------------------------------------------------
#  Description:
#    ACM Setup
# --------------------------------------------------------------------------
#    - ACM Certificate
#    - ACM Certificate Validation
# ==========================================================================

# --------------------------------------------------------------------------
#  ACM
# --------------------------------------------------------------------------
# ACM Certificate
resource "aws_acm_certificate" "selected" {
  domain_name       = var.domain_name
  validation_method = var.validation_method
  tags              = var.tags
}

# ACM Certificate Validation
resource "aws_acm_certificate_validation" "selected" {
  certificate_arn         = aws_acm_certificate.selected.arn
  validation_record_fqdns = var.validation_record_fqdns
}
