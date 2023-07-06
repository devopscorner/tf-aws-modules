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
resource "aws_instance" "ec2" {
  ami               = var.ami_id
  instance_type     = var.instance_type
  monitoring        = true
  availability_zone = var.aws_zone
  key_name          = var.key_pair_name
  ## Remote Terraform State ##
  subnet_id              = data.terraform_remote_state.core_state.outputs.ec2_public_1a
  vpc_security_group_ids = ["${aws_security_group.selected.id}"]

  tags = merge(
    local.tags,
    {
      "Name"    = "EC2-UBUNTU-AUTOSCALE",
      "Service" = "EC2"
    },
  )
  security_groups = ["${aws_security_group.selected.id}"]
}

resource "aws_eip" "ec2" {
  instance = aws_instance.ec2.id
}

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

  ## Userdata Script ##
  # user_data = base64encode(var.userdata_file)

  ## Userdata File ##
  user_data = base64encode(file(var.userdata_file))
}

resource "aws_autoscaling_group" "selected" {
  name             = var.asg_name
  min_size         = var.min_size
  max_size         = var.max_size
  desired_capacity = var.desired_capacity

  launch_template {
    id      = aws_launch_template.selected.id
    version = "$Latest"
  }
  vpc_zone_identifier = data.terraform_remote_state.core_state.outputs.subnet_ids
}

resource "aws_autoscaling_attachment" "selected" {
  autoscaling_group_name = aws_autoscaling_group.selected.name
  lb_target_group_arn    = var.target_group_arn
}
