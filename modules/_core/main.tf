# ==========================================================================
#  Core: main.tf
# --------------------------------------------------------------------------
#  Description:
#    Main Terraform Module
# --------------------------------------------------------------------------
#    - Workspace Environment
#    - Common Tags
# ==========================================================================

# --------------------------------------------------------------------------
#  Workspace Environmet
# --------------------------------------------------------------------------
locals {
  env = terraform.workspace
}

# --------------------------------------------------------------------------
#  Global Tags
# --------------------------------------------------------------------------
locals {
  tags = {
    Environment     = "${var.environment[local.workspace_env]}"
    Department      = "${var.department}"
    DepartmentGroup = "${var.environment[local.workspace_env]}-${var.department}"
    Terraform       = true
  }
}
