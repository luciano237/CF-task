# Creates an Application Load Balancer (ALB)
resource "aws_lb" "elb" {
  load_balancer_type = var.load_balancer_type
  subnets            = var.subnets
  security_groups    = [var.load_balancer_security_group]
  tags               = var.tags
}

# Create a target group for your EC2
resource "aws_lb_target_group" "ec2_TG_1" {
  name     = "${var.tags["Project"]}-${var.tags["env"]}-tagert-group"
  port     = 80
  protocol = var.http_protocol
  vpc_id   = var.vpc_id

  health_check {
    protocol            = var.http_protocol
    matcher             = var.success_code
    interval            = var.elb_hc_interval
    timeout             = var.elb_hc_timeout
    healthy_threshold   = var.elb_health_threshold
    unhealthy_threshold = var.elb_health_threshold
  }

  tags = var.tags
}

# Creates a listener for the ALB
resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.elb.arn
  port              = 80
  protocol          = var.http_protocol

  default_action {
    type             = var.default_action_lb
    target_group_arn = aws_lb_target_group.ec2_TG_1.arn
  }

  tags = var.tags
}

resource "aws_lb_listener" "http_2" {
  load_balancer_arn = aws_lb.elb.arn
  port              = 8080
  protocol          = var.http_protocol

  default_action {
    type             = var.default_action_lb
    target_group_arn = aws_lb_target_group.ec2_TG_1.arn
  }

  tags = var.tags
}

resource "aws_lb_listener" "http_3" {
  load_balancer_arn = aws_lb.elb.arn
  port              = 8000
  protocol          = var.http_protocol

  default_action {
    type             = var.default_action_lb
    target_group_arn = aws_lb_target_group.ec2_TG_1.arn
  }

  tags = var.tags
}

# Provides a Load Balancer Listener Rule resource
resource "aws_lb_listener_rule" "instance_1_listner" {
  listener_arn = aws_lb_listener.http.arn
  priority     = 100

  action {
    type             = var.default_action_lb
    target_group_arn = aws_lb_target_group.ec2_TG_1.arn
  }
  condition {
    path_pattern {
      values = ["*"]
    }
  }

  tags = var.tags

}

resource "aws_lb_listener_rule" "instance_2_listner" {
  listener_arn = aws_lb_listener.http_2.arn
  priority     = 100

  action {
    type             = var.default_action_lb
    target_group_arn = aws_lb_target_group.ec2_TG_1.arn
  }
  condition {
    path_pattern {
      values = ["*"]
    }
  }

  tags = var.tags

}

resource "aws_lb_listener_rule" "instance_3_listner" {
  listener_arn = aws_lb_listener.http_2.arn
  priority     = 100

  action {
    type             = var.default_action_lb
    target_group_arn = aws_lb_target_group.ec2_TG_1.arn
  }
  condition {
    path_pattern {
      values = ["*"]
    }
  }

  tags = var.tags

}


# EC2 attachment with ALB
resource "aws_lb_target_group_attachment" "tg_attachment_1" {
  target_group_arn = aws_lb_target_group.ec2_TG_1.arn
  target_id        = var.ec2_instance_id_1
  port             = 80
}

resource "aws_lb_target_group_attachment" "tg_attachment_test_2" {
  target_group_arn = aws_lb_target_group.ec2_TG_1.arn
  target_id        = var.ec2_instance_id_2
  port             = 80
}

resource "aws_lb_target_group_attachment" "tg_attachment_test_2" {
  target_group_arn = aws_lb_target_group.ec2_TG_1.arn
  target_id        = var.ec2_instance_id_3
  port             = 80
}
