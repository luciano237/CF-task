output "elb_dns" {
  description = "The DNS name of the ELB"
  value       = aws_lb.elb.dns_name
}

output "alb_targetgp_arn" {
  description = "target-group-id"
  value       = aws_lb_target_group.ec2_TG_1.arn
}

output "alb_id" {
  value = aws_lb.elb.id
}