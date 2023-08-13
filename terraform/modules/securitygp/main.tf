
# Creating a security group for public traffic
resource "aws_security_group" "loadbalancer_security_group" {
  name        = "${var.tags["Project"]}-${var.tags["env"]}-loadbalancersecurity-group"
  description = "Security group for public instances"
  vpc_id      = var.myvpc

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = var.tags
}

# Creating a security group for private access
resource "aws_security_group" "database_security_group" {
  name        = "${var.tags["Project"]}-${var.tags["env"]}-database-security-group"
  description = "Security group for private instances"
  vpc_id      = var.myvpc

  ingress {
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [aws_security_group.instance_security_group.id, aws_security_group.loadbalancer_security_group.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = var.tags
}


# Creating a security group for EC2 Instance traffic
resource "aws_security_group" "instance_security_group" {
  vpc_id      = var.myvpc
  name        = "${var.tags["Project"]}-${var.tags["env"]}-InstanceSecurityGroup"
  description = "security group that allows all ingress and all egress traffic"

  ingress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    security_groups = [aws_security_group.loadbalancer_security_group.id]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = var.tags
}

