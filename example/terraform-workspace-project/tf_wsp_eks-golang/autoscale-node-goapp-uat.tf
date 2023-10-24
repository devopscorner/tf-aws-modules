# ==========================================================================
#  EKS: autoscale-node-goapp-uat.tf (EKS Autoscale Configuration)
# --------------------------------------------------------------------------
#  Description
# --------------------------------------------------------------------------
#    - Node VPC Subnet
#    - Node Scaling
#    - Node Tagging
# ==========================================================================

#============================================
# NODE GROUP - GOAPP - UAT
#============================================
locals {
  #for tagging
  Environment_goapp_uat     = "UAT"
  Name_goapp_uat            = "EKS-1.27-GOAPP-UAT"
  Type_goapp_uat            = "PROJECTS"
  ProductName_goapp_uat     = "EKS-DEVOPSCORNER"
  ProductGroup_goapp_uat    = "UAT-EKS-DEVOPSCORNER"
  Department_goapp_uat      = "SOFTENG"
  DepartmentGroup_goapp_uat = "UAT-SOFTENG"
  ResourceGroup_goapp_uat   = "UAT-EKS-DEVOPSCORNER"
  Services_goapp_uat        = "GOAPP"
}

# --------------------------------------------------------------------------
#  Autoscaling Schedule Node
# --------------------------------------------------------------------------
# References:
# - https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_schedule
# - https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_attachment

## Scale Down
resource "aws_autoscaling_schedule" "scale_down_goapp_uat" {
  autoscaling_group_name = aws_eks_node_group.goapp["uat"].resources[0].autoscaling_groups[0].name
  desired_capacity       = 0
  max_size               = 0
  min_size               = 0
  recurrence             = "0 13,16 * * *"
  scheduled_action_name  = "scale_down"
  # start_time           = "2022-03-25T13:00:00Z"
}

## Scale Up
resource "aws_autoscaling_schedule" "scale_up_goapp_uat" {
  autoscaling_group_name = aws_eks_node_group.goapp["uat"].resources[0].autoscaling_groups[0].name
  desired_capacity       = 1
  max_size               = 5
  min_size               = 1
  recurrence             = "0 0 * * MON-FRI"
  scheduled_action_name  = "scale_up"
  # start_time           = "2022-03-28T00:00:00Z"
}

# --------------------------------------------------------------------------
#  Autoscaling Tag
# --------------------------------------------------------------------------
resource "aws_autoscaling_group_tag" "Environment_group_tag_goapp_uat" {
  for_each = toset(
    [for asg in flatten(
      [for resources in aws_eks_node_group.goapp["uat"].resources : resources.autoscaling_groups]
    ) : asg.name]
  )
  autoscaling_group_name = each.value
  tag {
    key                 = "Environment"
    value               = local.Environment_goapp_uat
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_group_tag" "Name_group_tag_goapp_uat" {
  for_each = toset(
    [for asg in flatten(
      [for resources in aws_eks_node_group.goapp["uat"].resources : resources.autoscaling_groups]
    ) : asg.name]
  )
  autoscaling_group_name = each.value
  tag {
    key                 = "Name"
    value               = local.Name_goapp_uat
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_group_tag" "Type_group_tag_goapp_uat" {
  for_each = toset(
    [for asg in flatten(
      [for resources in aws_eks_node_group.goapp["uat"].resources : resources.autoscaling_groups]
    ) : asg.name]
  )
  autoscaling_group_name = each.value
  tag {
    key                 = "Type"
    value               = local.Type_goapp_uat
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_group_tag" "ProductName_group_tag_goapp_uat" {
  for_each = toset(
    [for asg in flatten(
      [for resources in aws_eks_node_group.goapp["uat"].resources : resources.autoscaling_groups]
    ) : asg.name]
  )
  autoscaling_group_name = each.value
  tag {
    key                 = "ProductName"
    value               = local.ProductName_goapp_uat
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_group_tag" "ProductGroup_group_tag_goapp_uat" {
  for_each = toset(
    [for asg in flatten(
      [for resources in aws_eks_node_group.goapp["uat"].resources : resources.autoscaling_groups]
    ) : asg.name]
  )
  autoscaling_group_name = each.value
  tag {
    key                 = "ProductGroup"
    value               = local.ProductGroup_goapp_uat
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_group_tag" "Department_group_tag_goapp_uat" {
  for_each = toset(
    [for asg in flatten(
      [for resources in aws_eks_node_group.goapp["uat"].resources : resources.autoscaling_groups]
    ) : asg.name]
  )
  autoscaling_group_name = each.value
  tag {
    key                 = "Department"
    value               = local.Department_goapp_uat
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_group_tag" "DepartmentGroup_group_tag_goapp_uat" {
  for_each = toset(
    [for asg in flatten(
      [for resources in aws_eks_node_group.goapp["uat"].resources : resources.autoscaling_groups]
    ) : asg.name]
  )
  autoscaling_group_name = each.value
  tag {
    key                 = "DepartmentGroup"
    value               = local.DepartmentGroup_goapp_uat
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_group_tag" "ResourceGroup_group_tag_goapp_uat" {
  for_each = toset(
    [for asg in flatten(
      [for resources in aws_eks_node_group.goapp["uat"].resources : resources.autoscaling_groups]
    ) : asg.name]
  )
  autoscaling_group_name = each.value
  tag {
    key                 = "ResourceGroup"
    value               = local.ResourceGroup_goapp_uat
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_group_tag" "Services_group_tag_goapp_uat" {
  for_each = toset(
    [for asg in flatten(
      [for resources in aws_eks_node_group.goapp["uat"].resources : resources.autoscaling_groups]
    ) : asg.name]
  )
  autoscaling_group_name = each.value
  tag {
    key                 = "Service"
    value               = local.Services_goapp_uat
    propagate_at_launch = true
  }
}

// Mandatory TAGS for Cluster-Autoscaller
resource "aws_autoscaling_group_tag" "Clustername_group_tag_goapp_uat" {
  for_each = toset(
    [for asg in flatten(
      [for resources in aws_eks_node_group.goapp["uat"].resources : resources.autoscaling_groups]
    ) : asg.name]
  )
  autoscaling_group_name = each.value
  tag {
    key                 = "ClusterName"
    value               = "${var.eks_cluster_name}-${var.eks_name_env[local.env]}"
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_group_tag" "Autoscaler_ownership_group_tag_goapp_uat" {
  for_each = toset(
    [for asg in flatten(
      [for resources in aws_eks_node_group.goapp["uat"].resources : resources.autoscaling_groups]
    ) : asg.name]
  )
  autoscaling_group_name = each.value
  tag {
    key                 = "k8s.io/cluster-autoscaler/${var.eks_cluster_name}-${var.eks_name_env[local.env]}"
    value               = "owned"
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_group_tag" "Autoscaler_enable_group_tag_goapp_uat" {
  for_each = toset(
    [for asg in flatten(
      [for resources in aws_eks_node_group.goapp["uat"].resources : resources.autoscaling_groups]
    ) : asg.name]
  )
  autoscaling_group_name = each.value
  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    value               = "true"
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_group_tag" "Terraform_group_tag_goapp_uat" {
  for_each = toset(
    [for asg in flatten(
      [for resources in aws_eks_node_group.goapp["uat"].resources : resources.autoscaling_groups]
    ) : asg.name]
  )
  autoscaling_group_name = each.value
  tag {
    key                 = "Terraform"
    value               = "true"
    propagate_at_launch = true
  }
}

# --------------------------------------------------------------------------
#  Autoscaling Output
# --------------------------------------------------------------------------
## Scale Down ##
output "eks_node_scale_down_goapp_uat" {
  value = aws_autoscaling_schedule.scale_down_goapp_uat.arn
}

## Scale Up ##
output "eks_node_scale_up_goapp_uat" {
  value = aws_autoscaling_schedule.scale_up_goapp_uat.arn
}

# --------------------------------------------------------------------------
#  Autoscaling Node Group Output
# --------------------------------------------------------------------------
output "eks_node_asg_group_goapp_uat" {
  value = aws_eks_node_group.goapp["uat"].resources[0].autoscaling_groups[0].name
}
