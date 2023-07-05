# ==========================================================================
#  Infra Core: natgw-ec2.tf
# --------------------------------------------------------------------------
#  Description
#    NAT Gateway for EC2
# --------------------------------------------------------------------------
#    - NAT Gateway from Private Subnet
#    - EIP Enabled
#    - Route Table for Private Subnet with NAT Gateway
# ==========================================================================

# --------------------------------------------------------------------------
#  NAT GW Tags
# --------------------------------------------------------------------------
locals {
  ## EC2
  tags_nat_ec2_rt_private = {
    ResourceGroup = "${var.environment[local.env]}-RT-EC2"
  }
  tags_nat_ec2 = {
    ResourceGroup = "${var.environment[local.env]}-NAT-EC2"
  }
}

# --------------------------------------------------------------------------
#  EIP (enabled)
# --------------------------------------------------------------------------
## EC2
resource "aws_eip" "ec2" {
  tags = {
    "Name" = "${var.coreinfra}-${var.workspace_env[local.env]}-eip-ec2"
  }

  tags_all = {
    "Name" = "${var.coreinfra}-${var.workspace_env[local.env]}-eip-ec2"
  }
}

# --------------------------------------------------------------------------
#  NAT GW
# --------------------------------------------------------------------------
resource "aws_nat_gateway" "ec2_ngw" {
  allocation_id = aws_eip.ec2.id
  subnet_id     = aws_subnet.ec2_public_a.id

  tags = merge(local.tags, local.tags_nat_ec2, { Name = "${var.coreinfra}-${var.workspace_env[local.env]}-${var.nat_ec2_prefix}" })
}

## --------------------------------------------------------------------------
#  Route Table NAT GW
# --------------------------------------------------------------------------
## EC2
resource "aws_route_table" "nat_ec2_rt_private_a" {
  vpc_id = aws_vpc.infra_vpc.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.ec2_ngw.id
  }

  tags = merge(local.tags, local.tags_nat_ec2_rt_private, { Name = "${var.coreinfra}-${var.workspace_env[local.env]}-${var.ec2_rt_prefix}-private-${var.aws_region}a" }, local.tags_internal_elb)
}

resource "aws_route_table" "nat_ec2_rt_private_b" {
  vpc_id = aws_vpc.infra_vpc.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.ec2_ngw.id
  }

  tags = merge(local.tags, local.tags_nat_ec2_rt_private, { Name = "${var.coreinfra}-${var.workspace_env[local.env]}-${var.ec2_rt_prefix}-private-${var.aws_region}b" }, local.tags_internal_elb)
}

resource "aws_route_table" "nat_ec2_rt_private_c" {
  vpc_id = aws_vpc.infra_vpc.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.ec2_ngw.id
  }

  tags = merge(local.tags, local.tags_nat_ec2_rt_private, { Name = "${var.coreinfra}-${var.workspace_env[local.env]}-${var.ec2_rt_prefix}-private-${var.aws_region}c" }, local.tags_internal_elb)
}

# --------------------------------------------------------------------------
#  Route Table with Private Subnet
# --------------------------------------------------------------------------
## EC2
resource "aws_route_table_association" "nat_ec2_rt_private_1a" {
  subnet_id      = aws_subnet.ec2_private_a.id
  route_table_id = aws_route_table.nat_ec2_rt_private_a.id
}

resource "aws_route_table_association" "nat_ec2_rt_private_1b" {
  subnet_id      = aws_subnet.ec2_private_b.id
  route_table_id = aws_route_table.nat_ec2_rt_private_b.id
}

resource "aws_route_table_association" "nat_ec2_rt_private_1c" {
  subnet_id      = aws_subnet.ec2_private_c.id
  route_table_id = aws_route_table.nat_ec2_rt_private_c.id
}
