# Assigning Elastic IP - Future Integration
/* resource "aws_eip" "this" {
  vpc = true
} */

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  name   = "${var.tags["Project"]}-${var.tags["env"]}-vpc"
  cidr   = var.vpc_settings.vpc_cidr

  azs                      = var.vpc_settings.azs
  private_subnets          = var.vpc_settings.private_subnets
  public_subnets           = var.vpc_settings.public_subnets
  default_route_table_tags = { DefaultRouteTable = true }

  enable_dns_hostnames = var.enable_dns_hostnames
  enable_dns_support   = var.enable_dns_support
  create_igw           = var.create_igw
  enable_nat_gateway   = var.enable_nat_gateway
  /* external_nat_ip_ids  = aws_eip.this.*.id */ # Future Use

  enable_vpn_gateway         = var.enable_vpn_gateway
  single_nat_gateway         = var.single_nat_gateway
  one_nat_gateway_per_az     = var.one_nat_gateway_per_az
  manage_default_route_table = var.manage_default_route_table

  tags = var.tags
}

