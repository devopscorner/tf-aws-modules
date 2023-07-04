# ==========================================================================
#  Lightsails: _lightsails.tf
# --------------------------------------------------------------------------
#  Description:
#    Lightsails Setup
# --------------------------------------------------------------------------
#    - AWS Lightsail Resource
#    - AWS Lightsail Static IP
# ==========================================================================

# --------------------------------------------------------------------------
#  Lightsails
# --------------------------------------------------------------------------
resource "aws_lightsail_instance" "selected" {
  name              = var.instance_name
  availability_zone = var.availability_zone
  blueprint_id      = var.blueprint_id
  bundle_id         = var.bundle_id
  key_pair_name     = var.key_pair_name
  subnet_name       = data.terraform_remote_state.core_state.outputs.subnet_name
  vpc_id            = data.terraform_remote_state.core_state.outputs.vpc_id
}

resource "aws_lightsail_static_ip" "selected" {
  name = var.static_ip_name
}
