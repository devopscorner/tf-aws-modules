# ==========================================================================
#  Infra TFState: backend.tf
# --------------------------------------------------------------------------
#  Description:
#    Store Terraform State to S3
# --------------------------------------------------------------------------
#    - S3 Bucket Path
#    - DynamoDB Table
# ==========================================================================

# --------------------------------------------------------------------------
#  Store Path for Terraform State
# --------------------------------------------------------------------------
terraform {
  backend "s3" {
    region         = "ap-southeast-1"
    bucket         = "devopscorner-tf-remote-state"
    dynamodb_table = "devopscorner-tf-state-lock"
    key            = "tfstate/terraform.tfstate"
    encrypt        = true
  }
}
