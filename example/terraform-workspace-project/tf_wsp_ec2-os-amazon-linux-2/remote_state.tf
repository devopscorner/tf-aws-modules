# ==========================================================================
#  EC2: remote_state.tf
# --------------------------------------------------------------------------
#  Description:
#    Reference of Terraform state (existing *.tfstate)
# --------------------------------------------------------------------------
#    - Workspace Name
#    - Config Terraform State References
# ==========================================================================

# --------------------------------------------------------------------------
#  Use Existing Core Terraform Remote State
# --------------------------------------------------------------------------
data "terraform_remote_state" "core_state" {
  backend   = "s3"
  workspace = local.env

  config = {
    region = var.aws_region
    bucket = var.remote_tfstate_bucket
    key    = var.remote_tfstate_path
  }
}

# --------------------------------------------------------------------------
#  Remote Terraform State
# --------------------------------------------------------------------------
variable "remote_tfstate_bucket" {
  description = "Name of bucket to load references tfstate"
  type        = string
  default     = "devopscorner-tf-remote-state"
}

variable "remote_tfstate_path" {
  description = "Path remote references of .tfstate in Bucket"
  type        = string
  default     = "core/terraform.tfstate"
}
