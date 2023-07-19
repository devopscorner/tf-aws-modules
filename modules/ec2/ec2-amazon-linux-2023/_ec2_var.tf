# ==========================================================================
#  EC2: _ec2_var.tf
# --------------------------------------------------------------------------
#  Description:
#    EC2 Variable
# --------------------------------------------------------------------------
#    - AWS Availability Zone
#    - Instance Name
#    - AMI ID
#    - Instance Type
#    - Volume Size
#    - Ingress Port
#    - Ingress Protocol
#    - Userdata Script
#    - Userdata File
#    - Key Pair Name
#    - Static IP Name
# ==========================================================================

# --------------------------------------------------------------------------
#  EC2
# --------------------------------------------------------------------------
variable "aws_zone" {
  description = "The AWS zone to deploy the EC2 Instance in"
  type        = string
}

variable "instance_name" {
  description = "The name of the EC2 instance"
  type        = string
}

variable "ami_id" {
  description = "The ID of the Amazon Linux 2023 AMI"
  type        = string
  default     = "ami-0c91f4476780c2eaf"
}

variable "instance_type" {
  description = "The EC2 instance type"
  type        = string
}

variable "root_volume_size" {
  description = "The size of the EBS volume (in GB) for root partition"
  type        = number
}

variable "data_volume_size" {
  description = "The size of the EBS volume (in GB) for additional partition"
  type        = number
}

variable "security_group_name" {
  description = "The name of the EC2 instance security group"
  type        = string
}

variable "ingress_port" {
  description = "The port for ingress traffic in the security group"
  type        = number
}

variable "ingress_protocol" {
  description = "The protocol for ingress traffic in the security group"
  type        = string
}

variable "userdata" {
  description = "The userdata script for EC2 instance configuration"
  type        = string
}

variable "userdata_file" {
  description = "The path to the userdata file"
  type        = string
  default     = "./userdata/amazon-linux-2023.sh"
}

variable "key_pair_name" {
  description = "The name of the EC2 key pair"
  type        = string
}

variable "static_ip_name" {
  description = "The name of the EC2 static IP"
  type        = string
}
