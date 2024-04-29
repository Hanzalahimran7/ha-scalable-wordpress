// Create a load balancer in the created VPC
resource "aws_lb" "this" {
  name               = var.lb_name
  internal           = false
  load_balancer_type = "application"
  // Assign the security group that allows traffic to the LB
  security_groups = [aws_security_group.alb_sg.id]
  // Attach the LB to public subnets for internet-facing access
  subnets = module.vpc.public_subnets
}

// Target group for EC2 instances within the ASG
resource "aws_lb_target_group" "this" {
  name     = var.lb_target_group_name
  port     = 80 //Port on which targets receive traffic
  protocol = "HTTP"
  vpc_id   = module.vpc.vpc_id
}

resource "aws_lb_listener" "https_listener" {
  load_balancer_arn = aws_lb.this.arn
  port              = 443
  protocol          = "HTTPS"
  certificate_arn   = module.acm.acm_certificate_arn

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.this.arn
  }
}

resource "aws_lb_listener" "http_listener" {
  load_balancer_arn = aws_lb.this.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type = "redirect"
    redirect {
      port        = 443
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }
}

// Route traffic to the target created earlier
resource "aws_lb_listener_rule" "this" {
  listener_arn = aws_lb_listener.https_listener.arn
  priority     = 10
  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.this.arn
  }
  condition {
    host_header {
      values = ["*.${var.domain_name}"]
    }
  }
}
