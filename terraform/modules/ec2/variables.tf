variable "ec2_instance_type" {
  type = string
}

variable "availability_zone" {
  type    = string
  default = null
}

variable "vpc_details" {
  type = string
}

variable "instance_sg_id" {
  type = string
}

variable "key_pair_key_name" {
  type = string
}

variable "associate_public_ip_address" {
  type    = string
  default = true
}

variable "monitoring" {
  type    = string
  default = false
}

variable "ebs_optimized" {
  type    = string
  default = false
}

variable "tags" {
  type = map(string)
  default = {
    Project = "coalfire"
    env     = "stage"
  Terraform = true }
}

variable "instance_name" {
  description = "Name for the RDS instance"
  type        = string
  default     = "coalfire-instance"
}

variable "storage_size" {
  description = "Size for the EBS Volume"
  type        = string

}