# ==========================================================================
#  EKS: _eks_var.tf (Spesific Environment)
# --------------------------------------------------------------------------
#  Description
# --------------------------------------------------------------------------
#    - Input Variable for Environment Variables
# ==========================================================================

# --------------------------------------------------------------------------
#  AWS Zone
# --------------------------------------------------------------------------
variable "aws_az" {
  type        = map(string)
  description = "AWS Zone Target Deployment"
  default = {
    lab     = "ap-southeast-1a"
    staging = "ap-southeast-1a"
    prod    = "ap-southeast-1a"
  }
}

# --------------------------------------------------------------------------
#  KMS Key
# --------------------------------------------------------------------------
variable "kms_key" {
  type        = map(string)
  description = "KMS Key References"
  default = {
    lab     = "arn:aws:kms:ap-southeast-1:YOUR_AWS_ACCOUNT:key/CMK_KEY_HASH"
    staging = "arn:aws:kms:ap-southeast-1:YOUR_AWS_ACCOUNT:key/CMK_KEY_HASH"
    prod    = "arn:aws:kms:ap-southeast-1:YOUR_AWS_ACCOUNT:key/CMK_KEY_HASH"
  }
}

# --------------------------------------------------------------------------
#  KMS Environment
# --------------------------------------------------------------------------
variable "kms_env" {
  type        = map(string)
  description = "KMS Key Environment"
  default = {
    lab     = "RnD"
    staging = "Staging"
    prod    = "Production"
  }
}

# --------------------------------------------------------------------------
#  Bucket Name
# --------------------------------------------------------------------------
variable "bucket_name" {
  type        = string
  description = "Bucket Name"
  default     = "devopscorner-eks"
}

# --------------------------------------------------------------------------
#  SSH public key
# --------------------------------------------------------------------------
variable "ssh_public_key" {
  type        = string
  description = "SSH Public Key"
  ## file:///Users/[username]/.ssh/id_rsa.pub
  default = ""
}

# --------------------------------------------------------------------------
#  VPN Id
# --------------------------------------------------------------------------
variable "vpn_infra" {
  type        = map(string)
  description = "VPN Infra"
  default = {
    lab     = "sg-1234567890"
    staging = "sg-1234567890"
    prod    = "sg-0987654321"
  }
}

# --------------------------------------------------------------------------
#  EC2 Instance
# --------------------------------------------------------------------------
variable "access_my_ip" {
  type        = string
  description = "Your IP Address"
  default     = "118.136.0.0/22"
}

# --------------------------------------------------------------------------
#  DNS (Public)
# --------------------------------------------------------------------------
variable "dns_zone" {
  type = map(string)
  default = {
    dev     = "ZONE_ID"
    uat     = "ZONE_ID"
    lab     = "ZONE_ID"
    staging = "ZONE_ID"
    prod    = "ZONE_ID"
  }
}

variable "dns_url" {
  type = map(string)
  default = {
    lab     = "awscb.id"
    staging = "awscb.id"
    prod    = "awscb.id"
  }
}

# --------------------------------------------------------------------------
#  EKS Cluster
# --------------------------------------------------------------------------
# PEM File from existing
variable "eks_cluster_name" {
  type        = string
  description = "default cluster name"
  default     = "devopscorner"
}


# --------------------------------------------------------------------------
#  SSH configurations
# --------------------------------------------------------------------------
# PEM File from existing
variable "ssh_key_pair" {
  type        = map(string)
  description = "default keyname"
  default = {
    lab     = "devopscorner-poc"
    staging = "devopscorner-poc"
    prod    = "devopscorner-poc"
  }
}

variable "eks_name_env" {
  type = map(string)
  default = {
    lab     = "lab"
    staging = "staging"
    prod    = "prod"
  }
}

variable "k8s_version" {
  type = map(string)
  default = {
    lab     = "1.27"
    staging = "1.27"
    prod    = "1.27"
  }
}
