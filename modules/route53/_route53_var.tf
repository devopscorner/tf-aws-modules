# ==========================================================================
#  Route53: _route53_var.tf
# --------------------------------------------------------------------------
#  Description:
#    Route53 Variable
# --------------------------------------------------------------------------
#    - Zone Name
#    - Record Name
#    - Record Type
#    - Record TTL
#    - Record List
# ==========================================================================

# --------------------------------------------------------------------------
#  Route53
# --------------------------------------------------------------------------
variable "zone_name" {
  description = "The name of the Route53 zone"
  type        = string
}

variable "record_name" {
  description = "The name of the Route53 record"
  type        = string
}

variable "record_type" {
  description = "The type of the Route53 record"
  type        = string
}

variable "record_ttl" {
  description = "The TTL (Time to Live) of the Route53 record"
  type        = number
}

variable "record_records" {
  description = "The records associated with the Route53 record"
  type        = list(string)
}
