# ==========================================================================
#  Lightsail: _lightsails_var.tf
# --------------------------------------------------------------------------
#  Description:
#    Lightsails Variable
# --------------------------------------------------------------------------
#    - Instance Name
#    - Availability Zone
#    - Blueprint ID
#    - Keypair Name
#    - Static IP Name
# ==========================================================================

# --------------------------------------------------------------------------
#  Lightsails
# --------------------------------------------------------------------------
variable "instance_name" {
  description = "The name of the Lightsail instance"
  type        = string
}

variable "availability_zone" {
  description = "The availability zone for the Lightsail instance"
  type        = string
}

variable "blueprint_id" {
  description = "The ID of the Lightsail blueprint"
  type        = string
}

variable "bundle_id" {
  description = "The ID of the Lightsail bundle"
  type        = string
}

variable "key_pair_name" {
  description = "The name of the Lightsail key pair"
  type        = string
}

variable "static_ip_name" {
  description = "The name of the Lightsail static IP"
  type        = string
}
