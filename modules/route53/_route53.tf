# ==========================================================================
#  Route53: _route53.tf
# --------------------------------------------------------------------------
#  Description:
#    Route53 Setup
# --------------------------------------------------------------------------
#    - Route53 Zone
#    - Route53 Record
#    - Route53 Record VPC
# ==========================================================================

# --------------------------------------------------------------------------
#  Route53
# --------------------------------------------------------------------------
resource "aws_route53_zone" "selected" {
  name = var.zone_name
}

resource "aws_route53_record" "selected" {
  zone_id = aws_route53_zone.selected.zone_id
  name    = var.record_name
  type    = var.record_type
  ttl     = var.record_ttl
  records = var.record_records
}

# Use the VPC remote state output to create a record in Route53
resource "aws_route53_record" "vpc_dns" {
  zone_id = aws_route53_zone.selected.zone_id
  name    = "vpc.${data.terraform_remote_state.vpc.outputs.vpc_domain_name}"
  type    = "CNAME"
  ttl     = "300"
  records = [
    data.terraform_remote_state.vpc.outputs.vpc_dns_name,
  ]
}
