# ==========================================================================
#  Infra Core: igw-ec2.tf
# --------------------------------------------------------------------------
#  Description
#    Internet Gateway for EC2
# --------------------------------------------------------------------------
#    - IGW Public Subnet
#    - Route Table Public Subnet from IGW
# ==========================================================================

# --------------------------------------------------------------------------
#  IGW Tags
# --------------------------------------------------------------------------
locals {
  tags_igw_rt_public = {
    ResourceGroup = "${var.environment[local.env]}-RT"
    Name          = "${var.coreinfra}-${var.workspace_env[local.env]}-${var.igw_rt_prefix}"
  }

  tags_igw = {
    ResourceGroup = "${var.environment[local.env]}-IGW"
    Name          = "${var.coreinfra}-${var.workspace_env[local.env]}-${var.igw_prefix}"
  }

  tags_ec2_rt_public = {
    ResourceGroup = "${var.environment[local.env]}-RT-EC2"
    Name          = "${var.coreinfra}-${var.workspace_env[local.env]}-${var.ec2_rt_prefix}-public"
  }

  tags_ec2 = {
    ResourceGroup = "${var.environment[local.env]}-EC2"
    Name          = "${var.coreinfra}-${var.workspace_env[local.env]}-${var.ec2_rt_prefix}-public"
  }
}

# --------------------------------------------------------------------------
#  IGW
# --------------------------------------------------------------------------
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.infra_vpc.id

  tags = merge(local.tags, local.tags_igw, { Name = "${var.coreinfra}-${var.workspace_env[local.env]}-${var.igw_prefix}" }, local.tags_elb)
}

## --------------------------------------------------------------------------
#  Route Table for IGW
# --------------------------------------------------------------------------
## EC2
resource "aws_route_table" "igw_ec2_rt_public_a" {
  vpc_id = aws_vpc.infra_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = merge(local.tags, local.tags_igw_rt_public, { Name = "${var.coreinfra}-${var.workspace_env[local.env]}-${var.ec2_rt_prefix}-public-${var.aws_region}a" }, local.tags_elb)
}

resource "aws_route_table" "igw_ec2_rt_public_b" {
  vpc_id = aws_vpc.infra_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = merge(local.tags, local.tags_igw_rt_public, { Name = "${var.coreinfra}-${var.workspace_env[local.env]}-${var.ec2_rt_prefix}-public-${var.aws_region}b" }, local.tags_elb)
}

resource "aws_route_table" "igw_ec2_rt_public_c" {
  vpc_id = aws_vpc.infra_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = merge(local.tags, local.tags_igw_rt_public, { Name = "${var.coreinfra}-${var.workspace_env[local.env]}-${var.ec2_rt_prefix}-public-${var.aws_region}c" }, local.tags_elb)
}

# --------------------------------------------------------------------------
#  Route Table with Public Subnet
# --------------------------------------------------------------------------
## EC2
resource "aws_route_table_association" "igw_ec2_rt_public_1a" {
  subnet_id      = aws_subnet.ec2_public_a.id
  route_table_id = aws_route_table.igw_ec2_rt_public_a.id
}

resource "aws_route_table_association" "igw_ec2_rt_public_1b" {
  subnet_id      = aws_subnet.ec2_public_b.id
  route_table_id = aws_route_table.igw_ec2_rt_public_b.id
}

resource "aws_route_table_association" "igw_ec2_rt_public_1c" {
  subnet_id      = aws_subnet.ec2_public_c.id
  route_table_id = aws_route_table.igw_ec2_rt_public_c.id
}
