# ==========================================================================
#  EC2: _ec2_sg.tf
# --------------------------------------------------------------------------
#  Description:
#    EC2 Security Group
# --------------------------------------------------------------------------
#    - AWS Security Group Ingress
#    - AWS Security Group Egress
# ==========================================================================

# --------------------------------------------------------------------------
#  EC2 Security Group
# --------------------------------------------------------------------------
resource "aws_security_group" "selected" {
  name        = var.security_group_name
  description = "Security group for EC2 instance"

  vpc_id = data.terraform_remote_state.core_state.outputs.vpc_id

  ingress {
    from_port   = var.ingress_port
    to_port     = var.ingress_port
    protocol    = var.ingress_protocol
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group_rule" "ssh" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.selected.id
}

resource "aws_security_group_rule" "web" {
  type              = "ingress"
  from_port         = 8000
  to_port           = 8000
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.selected.id
}
