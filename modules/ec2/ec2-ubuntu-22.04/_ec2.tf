# ==========================================================================
#  EC2: _ec2.tf
# --------------------------------------------------------------------------
#  Description:
#    EC2 Setup
# --------------------------------------------------------------------------
#    - AWS Launch Template
# ==========================================================================

# --------------------------------------------------------------------------
#  EC2
# --------------------------------------------------------------------------
resource "aws_launch_template" "selected" {
  name          = var.instance_name
  image_id      = var.ami_id
  instance_type = var.instance_type

  block_device_mappings {
    device_name = "/dev/sda1"
    ebs {
      volume_size = var.volume_size
    }
  }

  user_data = base64encode(file(var.userdata_file))
}
