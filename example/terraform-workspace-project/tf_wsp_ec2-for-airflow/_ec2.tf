# ==========================================================================
#  EC2: _ec2.tf
# --------------------------------------------------------------------------
#  Description:
#    EC2 Setup
# --------------------------------------------------------------------------
#    - AWS Launch Template
# ==========================================================================

# --------------------------------------------------------------------------
#  Resources Tags
# --------------------------------------------------------------------------
locals {
  resources_tags = {
    Name          = "${var.instance_name}-${var.env[local.env]}",
    ResourceGroup = "${var.environment[local.env]}-EC2-AIRFLOW"
  }

  ebs_tags = {
    Name          = "${var.instance_name}-${var.env[local.env]}",
    ResourceGroup = "${var.environment[local.env]}-EBS-AIRFLOW"
  }

  eip_tags = {
    Name          = "${var.instance_name}-${var.env[local.env]}",
    ResourceGroup = "${var.environment[local.env]}-EIP-AIRFLOW"
  }
}

locals {
  ssh_pubkey = "${var.key_pair_name}" == "" ? file("~/.ssh/id_rsa.pub") : "${var.key_pair_name}"
  subnet_id  = "${var.env[local.env]}" == "lab" ? data.terraform_remote_state.core_state.outputs.ec2_public_1a[0] : data.terraform_remote_state.core_state.outputs.ec2_public_1b[0]
}

# --------------------------------------------------------------------------
#  Existing Zone ID (DNS)
# --------------------------------------------------------------------------
locals {
  domain      = "${var.instance_name}-${var.env[local.env]}.${var.dns_url[local.env]}"
  domain_name = trimsuffix(local.domain, ".")
}

# --------------------------------------------------------------------------
#  EC2
# --------------------------------------------------------------------------
resource "aws_instance" "airflow" {
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
      "Name"    = "EC2-AIRFLOW",
      "Service" = "EC2"
    },
  )
  security_groups = ["${aws_security_group.selected.id}"]

  root_block_device {
    device_name           = "/dev/sda1"
    delete_on_termination = true
    volume_size           = var.root_volume_size
    volume_type           = "gp3"
    tags                  = merge(local.tags, local.ebs_tags)
  }

  ebs_block_device {
    device_name           = "/dev/sdb"
    delete_on_termination = true
    volume_size           = var.data_volume_size
    volume_type           = "gp3"
    tags                  = merge(local.tags, local.ebs_tags)
  }

  lifecycle {
    prevent_destroy = true
    ignore_changes = [
      tags,
    ]
  }

  ## Userdata Script ##
  # user_data = base64encode(var.userdata_file)

  ## Userdata File ##
  user_data = base64encode(file(var.userdata_file))
}

# --------------------------------------------------------------------------
#  Elastic IP
# --------------------------------------------------------------------------
resource "aws_eip" "airflow" {
  instance = aws_instance.ec2.id
  tags     = merge(local.tags, local.eip_tags)
}

# --------------------------------------------------------------------------
#  Load Balancer & Domain Routes
# --------------------------------------------------------------------------
resource "aws_route53_record" "airflow" {
  zone_id = var.dns_zone[local.env]
  name    = local.domain_name
  type    = "CNAME"
  ttl     = 300
  records = ["${aws_elb.airflow.dns_name}"]
}

# resource "aws_route53_record" "airflow" {
#   zone_id = var.dns_zone[local.env]
#   name    = local.domain_name
#   type    = "A"

#   alias {
#     name                   = "${aws_elb.airflow.dns_name}"
#     zone_id                = "${aws_elb.airflow.zone_id}"
#     evaluate_target_health = true
#   }
# }
