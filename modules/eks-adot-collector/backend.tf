# ==========================================================================
#  Resources: EKS-ADOT / backend.tf (Storing tfstate)
# --------------------------------------------------------------------------
#  Description
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
    key            = "resources/eks-adot/terraform.tfstate"
    encrypt        = true
  }
}
