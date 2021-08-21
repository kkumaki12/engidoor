/* front */
resource "aws_lb" "engidoor-alb-tf" {
  name                       = "engidoor-alb-tf"
  load_balancer_type         = "application"
  internal                   = false
  idle_timeout               = 60
  enable_deletion_protection = true

  subnets = [
    aws_subnet.engidoor-front-subnet-1a-tf.id,
    aws_subnet.engidoor-front-subnet-1c-tf.id
  ]

  security_groups = [
    aws_security_group.engidoor-alb-sg-tf.id
  ]

  tags = {
    Name = "engidoor-alb-tf"
  }
}
/* back */
resource "aws_lb" "engidoor-back-alb-tf" {
  name                       = "engidoor-back-alb-tf"
  load_balancer_type         = "application"
  internal                   = false
  idle_timeout               = 60
  enable_deletion_protection = true

  subnets = [
    aws_subnet.engidoor-back-subnet-1a-tf.id,
    aws_subnet.engidoor-back-subnet-1c-tf.id
  ]

  security_groups = [
    aws_security_group.engidoor-alb-sg-tf.id
  ]

  tags = {
    Name = "engidoor-back-alb-tf"
  }
}

/* listener */
resource "aws_lb_listener" "engidoor-http-listener-tf" {
  load_balancer_arn = aws_lb.engidoor-alb-tf.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_lb_target_group.engidoor-alb-front-tg-tf.arn
    type             = "forward"

    fixed_response {
      content_type = "text/plain"
      message_body = "これはHTTPS"
      status_code = "200"
    }
  }
  
}
/* resource "aws_lb_listener" "engidoor-https-listener-tf" {
  load_balancer_arn = aws_lb.engidoor-alb-tf.arn
  port              = "443"
  protocol          = "HTTPS"
  certificate_arn   = aws_acm_certificate.engidoor-front-acm-tf.arn

  default_action {
    target_group_arn = aws_lb_target_group.engidoor-alb-front-tg-tf.arn
    type             = "forward"

    fixed_response {
      content_type = "text/plain"
      message_body = "これはHTTPS"
      status_code = "200"
    }
  }
}
*/

# バックエンド用
resource "aws_lb_listener" "engidoor-back-http-listener-tf" {
  load_balancer_arn = aws_lb.engidoor-back-alb-tf.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_lb_target_group.engidoor-alb-back-tg-tf.arn
    type             = "forward"
  }
}

/* resource "aws_lb_listener" "engidoor-back-https-listener-tf" {
  load_balancer_arn = aws_lb.engidoor-back-alb-tf.arn
  port              = "443"
  protocol          = "HTTPS"
  certificate_arn   = aws_acm_certificate.engidoor-acm-tf.arn

  default_action {
    target_group_arn = aws_lb_target_group.engidoor-alb-back-tg-tf.arn
    type             = "forward"
  }
}
*/

/* ターゲットグループ */
resource "aws_lb_target_group" "engidoor-alb-front-tg-tf" {
  name        = "engidoor-alb-front-tg-tf"
  target_type = "ip"
  vpc_id      = aws_vpc.engidoor-vpc-tf.id
  port        = 80
  protocol    = "HTTP"

  health_check {
    enabled             = true
    path                = "/"
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 120
    interval            = 150
    matcher             = 200
    port                = 80
    protocol            = "HTTP"
  }
}

resource "aws_lb_target_group" "engidoor-alb-back-tg-tf" {
  name        = "engidoor-alb-back-tg-tf"
  target_type = "ip"
  vpc_id      = aws_vpc.engidoor-vpc-tf.id
  port        = 80
  protocol    = "HTTP"

  health_check {
    enabled             = true
    interval            = 60
    path                = "/api/v1/health_check"
    port                = 3000
    protocol            = "HTTP"
    matcher             = 200
    timeout             = 50
    healthy_threshold   = 5
    unhealthy_threshold = 2
  }
}
