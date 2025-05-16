resource "aws_lb" "openproject_alb" {
  name               = "focal-board"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.alb_security_group_id]
  subnets            = var.subnet_ids

  enable_deletion_protection = false

  tags = {
    Name = "focal-board-ALB"
  }
}

resource "aws_lb_target_group" "openproject_tg" {
  name     = "focal-board-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    path                = "/login"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }

  tags = {
    Name = "OpenProject-TG"
  }
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.openproject_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.openproject_tg.arn
  }
}

resource "aws_lb_target_group_attachment" "openproject" {
  target_group_arn = aws_lb_target_group.openproject_tg.arn
  target_id        = var.instance_id
  port             = 8080
}

