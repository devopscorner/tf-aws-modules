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
#    - Core Prefix EC2
#    - Core Prefix NAT EC2
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
# EC2 Prefix
variable "ec2_prefix" {
  description = "EC2 Prefix Name"
  type        = string
  default     = "ec2"
}

# -------------------------------------------------------------------------- ----------
#  NAT Gateway
# -------------------------------------------------------------------------- ----------
# NAT EC2 Prefix
variable "nat_ec2_prefix" {
  description = "NAT EC2 Prefix Name"
  type        = string
  default     = "natgw_ec2"
}

# -------------------------------------------------------------------------- ----------
#  Subnet
# -------------------------------------------------------------------------- ----------
## EC2 Private
variable "ec2_private_a" {
  description = "Private Subnet for EC2 Zone A"
  type        = map(string)
  default = {
    default = "10.16.16.0/21"
    lab     = "10.16.16.0/21"
    staging = "10.32.16.0/21"
    prod    = "10.48.16.0/21"
  }
}

variable "ec2_private_b" {
  description = "Private Subnet for EC2 Zone B"
  type        = map(string)
  default = {
    default = "10.16.24.0/21"
    lab     = "10.16.24.0/21"
    staging = "10.32.24.0/21"
    prod    = "10.48.24.0/21"
  }
}

variable "ec2_private_c" {
  description = "Private Subnet for EC2 Zone C"
  type        = map(string)
  default = {
    default = "10.16.32.0/21"
    lab     = "10.16.32.0/21"
    staging = "10.32.32.0/21"
    prod    = "10.48.32.0/21"
  }
}

## EC2 Public
variable "ec2_public_a" {
  description = "Public Subnet for EC2 Zone A"
  type        = map(string)
  default = {
    default = "10.16.40.0/21"
    lab     = "10.16.40.0/21"
    staging = "10.32.40.0/21"
    prod    = "10.48.40.0/21"
  }
}

variable "ec2_public_b" {
  description = "Public Subnet for EC2 Zone B"
  type        = map(string)
  default = {
    default = "10.16.48.0/21"
    lab     = "10.16.48.0/21"
    staging = "10.32.48.0/21"
    prod    = "10.48.48.0/21"
  }
}

variable "ec2_public_c" {
  description = "Public Subnet for EC2 Zone C"
  type        = map(string)
  default = {
    default = "10.16.56.0/21"
    lab     = "10.16.56.0/21"
    staging = "10.32.56.0/21"
    prod    = "10.48.56.0/21"
  }
}

# -------------------------------------------------------------------------- ----------
#  Routing Table
# -------------------------------------------------------------------------- ----------
# EC2 RT Prefix
variable "ec2_rt_prefix" {
  description = "NAT EC2 Routing Table Prefix Name"
  type        = string
  default     = "ec2-rt"
}

# -------------------------------------------------------------------------- ----------
#  Internet Gateway
# -------------------------------------------------------------------------- ----------
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

# -------------------------------------------------------------------------- ----------
#  NAT Gateway
# -------------------------------------------------------------------------- ----------
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