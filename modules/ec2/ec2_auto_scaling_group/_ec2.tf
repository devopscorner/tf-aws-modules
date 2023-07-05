# ==========================================================================
#  EC2: _ec2.tf
# --------------------------------------------------------------------------
#  Description:
#    EC2 Setup
# --------------------------------------------------------------------------
#    - AWS Launch Template
#    - AWS Autoscaling Group
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

resource "aws_autoscaling_group" "selected" {
  name                 = var.asg_name
  min_size             = var.min_size
  max_size             = var.max_size
  desired_capacity     = var.desired_capacity
  launch_template      = {
    id      = aws_launch_template.selected.id
    version = "$Latest"
  }
  vpc_zone_identifier  = data.terraform_remote_state.core_state.outputs.subnet_ids
}

resource "aws_autoscaling_attachment" "selected" {
  autoscaling_group_name = aws_autoscaling_group.selected.name
  alb_target_group_arn   = var.target_group_arn
}
