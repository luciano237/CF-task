variable "load_balancer_security_group" {
  type        = string
  description = "Type of the load balancer"
}

variable "vpc_id" {
  type        = string
  description = "Type of the load balancer"
}

variable "success_code" {
  description = "Success code"
  type        = string
  default     = "200"
}

variable "subnets" {}

variable "load_balancer_type" {
  description = "Type of the load balancer"
  type        = string
  default     = "application"
}

variable "tags" {
  type = map(string)
  default = {
    Project = "coalfire"
    env     = "stage"
  Terraform = true }
}

variable "http_protocol" {
  description = "HTTP protocol used for the health check"
  type        = string
  default     = "HTTP"
}

variable "default_action_lb" {
  description = "Default action for the load balancer"
  type        = string
  default     = "forward"
}

variable "elb_hc_interval" {
  description = "Interval for the load balancer"
  type        = number
  default     = 30
}

variable "elb_hc_timeout" {
  description = "Timeput for the load balancer"
  type        = number
  default     = 5
}

variable "elb_health_threshold" {
  description = "Timeout for the load balancer"
  type        = number
  default     = 3
}

variable "ec2_instance_id_1" {
  description = "EC2 ID for the load balancer"
  type        = string
}

variable "ec2_instance_id_2" {
  description = "EC2 ID for the load balancer"
  type        = string
}
variable "ec2_instance_id_3" {
  description = "EC2 ID for the load balancer"
  type        = string
}