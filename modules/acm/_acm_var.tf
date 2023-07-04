# ==========================================================================
#  ACM: _acm_var.tf
# --------------------------------------------------------------------------
#  Description:
#    ACM Variable
# --------------------------------------------------------------------------
#    - Domain Name
#    - Validation Method
#    - Tags
#    - Record FQDN (list)
# ==========================================================================

# --------------------------------------------------------------------------
#  ACM
# --------------------------------------------------------------------------
variable "domain_name" {
  description = "The domain name for the ACM certificate"
  type        = string
}

variable "validation_method" {
  description = "The validation method for the ACM certificate"
  type        = string
}

variable "tags" {
  description = "Tags to apply to the ACM certificate"
  type        = map(string)
}

variable "validation_record_fqdns" {
  description = "The FQDNs for ACM certificate validation"
  type        = list(string)
}
