# ==========================================================================
#  Infra Core: core-vars.tf
# --------------------------------------------------------------------------
#  Description
#    Core Infrastructure Spesific Variable
# --------------------------------------------------------------------------
#    - Core Prefix Name
#    - Core VPC CIDR Block
#    - Core VPC CIDR Secondary Zone A
#    - Core VPC CIDR Secondary Zone B
#    - Core Prefix EKS
#    - Core Prefix NAT EKS
# ==========================================================================

# --------------------------------------------------------------------------
#  Prefix Infra
# --------------------------------------------------------------------------
variable "coreinfra" {
  description = "Core Infrastrucre Name Prefix"
  type        = string
  default     = "devopscorner-tf"
}

# --------------------------------------------------------------------------
#  VPC
# --------------------------------------------------------------------------
variable "vpc_cidr" {
  description = "Core Infrastrucre CIDR Block"
  type        = map(string)
  default = {
    default = "10.16.0.0/16"
    lab     = "10.16.0.0/16"
    staging = "10.32.0.0/16"
    prod    = "10.48.0.0/16"
  }
}

# --------------------------------------------------------------------------
#  Infra Prefix
# --------------------------------------------------------------------------
# EKS Prefix
variable "eks_prefix" {
  description = "EKS Prefix Name"
  type        = string
  default     = "eks"
}

# --------------------------------------------------------------------------
#  NAT Gateway
# --------------------------------------------------------------------------
# NAT EKS Prefix
variable "nat_eks_prefix" {
  description = "NAT EKS Prefix Name"
  type        = string
  default     = "natgw_eks"
}

# --------------------------------------------------------------------------
#  Subnet
# --------------------------------------------------------------------------
## EKS Private
variable "eks_private_a" {
  description = "Private Subnet for EKS Zone A"
  type        = map(string)
  default = {
    default = "10.16.64.0/21"
    lab     = "10.16.64.0/21"
    staging = "10.32.64.0/21"
    prod    = "10.48.64.0/21"
  }
}

variable "eks_private_b" {
  description = "Private Subnet for EKS Zone B"
  type        = map(string)
  default = {
    default = "10.16.72.0/21"
    lab     = "10.16.72.0/21"
    staging = "10.32.72.0/21"
    prod    = "10.48.72.0/21"
  }
}

variable "eks_private_c" {
  description = "Private Subnet for EKS Zone C"
  type        = map(string)
  default = {
    default = "10.16.80.0/21"
    lab     = "10.16.80.0/21"
    staging = "10.32.80.0/21"
    prod    = "10.48.80.0/21"
  }
}

## EKS Public
variable "eks_public_a" {
  description = "Public Subnet for EKS Zone A"
  type        = map(string)
  default = {
    default = "10.16.88.0/21"
    lab     = "10.16.88.0/21"
    staging = "10.32.88.0/21"
    prod    = "10.48.88.0/21"
  }
}

variable "eks_public_b" {
  description = "Public Subnet for EKS Zone B"
  type        = map(string)
  default = {
    default = "10.16.96.0/21"
    lab     = "10.16.96.0/21"
    staging = "10.32.96.0/21"
    prod    = "10.48.96.0/21"
  }
}

variable "eks_public_c" {
  description = "Public Subnet for EKS Zone C"
  type        = map(string)
  default = {
    default = "10.16.104.0/21"
    lab     = "10.16.104.0/21"
    staging = "10.32.104.0/21"
    prod    = "10.48.104.0/21"
  }
}

# --------------------------------------------------------------------------
#  Routing Table
# --------------------------------------------------------------------------
# EKS RT Prefix
variable "eks_rt_prefix" {
  description = "NAT EKS Routing Table Prefix Name"
  type        = string
  default     = "eks-rt"
}

# --------------------------------------------------------------------------
#  Internet Gateway
# --------------------------------------------------------------------------
# IGW Prefix
variable "igw_prefix" {
  description = "IGW Prefix Name"
  type        = string
  default     = "igw"
}

# IGW RT Prefix
variable "igw_rt_prefix" {
  description = "IGW Routing Table Prefix Name"
  type        = string
  default     = "igw-rt"
}

# --------------------------------------------------------------------------
#  NAT Gateway
# --------------------------------------------------------------------------
# NAT Prefix
variable "nat_prefix" {
  description = "NAT Prefix Name"
  type        = string
  default     = "nat"
}

# NAT RT Prefix
variable "nat_rt_prefix" {
  description = "NAT Routing Table Prefix Name"
  type        = string
  default     = "nat-rt"
}