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
#    - Autoscaling Group Name
#    - Minimum Size Capacity Autoscaling Group
#    - Maximum Size Capacity Autoscaling Group
#    - Desire Size Capacity Autoscaling Group
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
  description = "The ID of the Ubuntu 22.04 AMI"
  type        = string
  default     = "ami-0d21214905506a7f4"
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

variable "asg_name" {
  description = "The name of the Autoscaling Group"
  type        = string
}

variable "min_size" {
  description = "The minimum number of instances in the Autoscaling Group"
  type        = number
}

variable "max_size" {
  description = "The maximum number of instances in the Autoscaling Group"
  type        = number
}

variable "desired_capacity" {
  description = "The desired capacity of the Autoscaling Group"
  type        = number
}

variable "target_group_arn" {
  description = "The ARN of the ALB target group"
  type        = string
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
  default     = "./userdata/ubuntu.sh"
}

variable "key_pair_name" {
  description = "The name of the EC2 key pair"
  type        = string
}

variable "static_ip_name" {
  description = "The name of the EC2 static IP"
  type        = string
}
