# ==========================================================================
#  EC2: _ec2_var.tf
# --------------------------------------------------------------------------
#  Description:
#    EC2 Variable
# --------------------------------------------------------------------------
#    - Instance Name
#    - AMI ID
#    - Instance Type
#    - Volume Size
#    - Userdata
#    - Target Group ALB (Application Load Balancer) ARN
#    - Security Group Name
#    - Monthly Budget Time Period Start
# ==========================================================================

# --------------------------------------------------------------------------
#  EC2
# --------------------------------------------------------------------------
variable "instance_name" {
  description = "The name of the EC2 instance"
  type        = string
}

variable "ami_id" {
  description = "The ID of the Ubuntu AMI"
  type        = string
  default     = "ami-0d21214905506a7f4"
}

variable "instance_type" {
  description = "The EC2 instance type"
  type        = string
}

variable "volume_size" {
  description = "The size of the EBS volume (in GB)"
  type        = number
}

variable "userdata" {
  description = "The userdata script for EC2 instance configuration"
  type        = string
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

variable "userdata_file" {
  description = "The path to the userdata file"
  type        = string
  default     = "./userdata/ubuntu.sh"
}