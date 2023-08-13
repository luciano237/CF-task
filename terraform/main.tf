
# VPC
module "vpc" {
  source       = "./modules/vpc"
  vpc_settings = var.vpc

}

# Security-group
module "security_group" {
  source = "./modules/securitygp"
  myvpc  = module.vpc.vpc_id

}

# EC2 
module "bastion_instance_1" {
  source            = "./modules/ec2"
  instance_name     = "wpserver-stage-instance-1"
  vpc_details       = module.vpc.public_subnets[0]
  instance_sg_id    = module.security_group.instance_security_group
  ec2_instance_type = "t3a.medium"
  storage_size      = "50"
  key_pair_key_name = "wpserver-ohio-keypair" # Already Created
}

module "wpserver_ec2_1" {
  source            = "./modules/ec2"
  instance_name     = "wpserver-stage-instance-1"
  vpc_details       = module.vpc.private_subnets[0]
  instance_sg_id    = module.security_group.instance_security_group
  ec2_instance_type = var.ec2_instance_type
  storage_size      = "20"
  key_pair_key_name = "wpserver-ohio-keypair" # Already Created
}

module "wpserver_ec2_2" {
  source            = "./modules/ec2"
  instance_name     = "wpserver-stage-instance-2"
  vpc_details       = module.vpc.private_subnets[0]
  instance_sg_id    = module.security_group.instance_security_group
  ec2_instance_type = var.ec2_instance_type
  storage_size      = "20"
  key_pair_key_name = "wpserver-ohio-keypair" # Already Created
}

# ALB
module "alb" {
  source                       = "./modules/alb"
  load_balancer_security_group = module.security_group.loadbalancer_security_group
  vpc_id                       = module.vpc.vpc_id
  ec2_instance_id_1            = module.wpserver_ec2_1.EC2_ID
  ec2_instance_id_2            = module.wpserver_ec2_2.EC2_ID
  ec2_instance_id_3            = module.bastion_instance_1.EC2_ID
  subnets                      = module.vpc.public_subnets
}

# RDS
module "rds" {
  source               = "./modules/rds"
  subnet_ids           = module.vpc.private_subnets
  rds_securitygroup_id = module.security_group.database_security_group
  db_instance_password = var.db_instance_password
}
