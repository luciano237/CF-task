variable "vpc_settings" {
  type = object({
    vpc_cidr        = string
    private_subnets = list(string)
    public_subnets  = list(string)
    azs             = list(string)
  })
}

variable "tags" {
  type = map(string)
  default = {
    Project = "coalfire"
    env     = "stage"
  Terraform = true }
}

variable "enable_dns_hostnames" {
  type    = string
  default = true
}

variable "enable_dns_support" {
  type    = string
  default = true
}

variable "enable_nat_gateway" {
  type    = string
  default = true
}

variable "enable_vpn_gateway" {
  type    = string
  default = false
}

variable "single_nat_gateway" {
  type    = string
  default = true
}

variable "one_nat_gateway_per_az" {
  type    = string
  default = true
}

variable "manage_default_route_table" {
  type    = string
  default = true
}

variable "create_igw" {
  type    = string
  default = true
}