output "loadbalancer_security_group" {
  value = aws_security_group.loadbalancer_security_group.id
}

output "database_security_group" {
  value = aws_security_group.database_security_group.id
}

output "instance_security_group" {
  value = aws_security_group.instance_security_group.id
}