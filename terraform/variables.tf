
variable "aws_region" {}
variable "vpc" {}
variable "ec2_instance_type" {}
variable "db_instance_password" {
  default = "gencoderstagedb"
}