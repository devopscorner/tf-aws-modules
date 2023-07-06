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
      "Name"    = "EC2-AMAZON-LINUX-2023",
      "Service" = "EC2"
    },
  )
  security_groups = ["${aws_security_group.selected.id}"]

  root_block_device {
    device_name           = "/dev/sda1"
    delete_on_termination = true
    volume_size           = var.volume_size
    volume_type           = "gp2"
  }

  ebs_block_device {
    device_name           = "/dev/sdb"
    delete_on_termination = true
    volume_size           = var.volume_size
    volume_type           = "gp2"
  }

  ## Userdata Script ##
  # user_data = base64encode(var.userdata_file)

  ## Userdata File ##
  user_data = base64encode(file(var.userdata_file))
}

resource "aws_eip" "ec2" {
  instance = aws_instance.ec2.id
}
