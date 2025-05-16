# Define the ALB
resource "aws_lb" "alb" {
    name               = "example-alb"
    internal           = false
    load_balancer_type = "application"
    security_groups    = [var.alb_security_group_id]
    subnets            = var.subnets

    enable_deletion_protection = false
}

# Define the Target Group with Health Check
resource "aws_lb_target_group" "alb_target_group" {
    name        = "example-target-group"
    port        = 8000
    protocol    = "HTTP"
    vpc_id      = var.vpc_id
    target_type = "instance"

    health_check {
        path                = "/"
        port                = "8000"
        protocol            = "HTTP"
        interval            = 30
        timeout             = 5
        healthy_threshold   = 2
        unhealthy_threshold = 2
    }
}

# Define the Listener
resource "aws_lb_listener" "alb_listener" {
    load_balancer_arn = aws_lb.alb.arn
    port              = 80
    protocol          = "HTTP"

    default_action {
        type             = "forward"
        target_group_arn = aws_lb_target_group.alb_target_group.arn
    }
}

# Example: Attach EC2 instances to the Target Group
resource "aws_lb_target_group_attachment" "example" {
  target_group_arn = aws_lb_target_group.alb_target_group.arn
  target_id        = var.instance_id
  port             = 8000
}
