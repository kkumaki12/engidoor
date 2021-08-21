/* security group for RDB */
resource "aws_security_group_rule" "engidoor-rds-sg-rule1-tf" {
  description       = "engidoor-rds-sg-rule1-tf"
  type              = "ingress"
  from_port         = 3306
  to_port           = 3306
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0", "0.0.0.0/16"]
  security_group_id = aws_security_group.engidoor-rds-sg-tf.id
}
resource "aws_security_group_rule" "engidoor-rds-sg-rule2-tf" {
  description       = "engidoor-rds-sg-rule2-tf"
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.engidoor-rds-sg-tf.id
}
resource "aws_security_group_rule" "engidoor-rds-sg-rule3-tf" {
  description       = "engidoor-rds-sg-rule3-tf"
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  ipv6_cidr_blocks  = ["::/0"]
  security_group_id = aws_security_group.engidoor-rds-sg-tf.id
}
resource "aws_security_group_rule" "engidoor-rds-sg-rule4-tf" {
  description              = "engidoor-rds-sg-rule4-tf"
  type                     = "ingress"
  from_port                = 3306
  to_port                  = 3306
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.engidoor-alb-sg-tf.id
  security_group_id        = aws_security_group.engidoor-rds-sg-tf.id
}

/* security group for ALB*/
resource "aws_security_group_rule" "engidoor-alb-sg-rule1-tf" {
  description       = "engidoor-alb-sg-rule1-tf"
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0", "0.0.0.0/16"]
  security_group_id = aws_security_group.engidoor-alb-sg-tf.id
}
resource "aws_security_group_rule" "engidoor-alb-sg-rule2-tf" {
  description       = "engidoor-alb-sg-rule2-tf"
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0", "0.0.0.0/16"]
  security_group_id = aws_security_group.engidoor-alb-sg-tf.id
}
resource "aws_security_group_rule" "engidoor-alb-sg-rule3-tf" {
  description       = "engidoor-alb-sg-rule3-tf"
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.engidoor-alb-sg-tf.id
}
resource "aws_security_group_rule" "engidoor-alb-sg-rule4-tf" {
  description       = "engidoor-alb-sg-rule4-tf"
  type              = "ingress"
  from_port         = 8
  to_port           = 0
  protocol          = "icmp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.engidoor-alb-sg-tf.id
}
resource "aws_security_group_rule" "engidoor-alb-sg-rule5-tf" {
  description       = "engidoor-alb-sg-rule5-tf"
  type              = "ingress"
  from_port         = 5000
  to_port           = 5000
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.engidoor-alb-sg-tf.id
}
resource "aws_security_group_rule" "engidoor-alb-sg-rule6-tf" {
  description       = "engidoor-alb-sg-rule6-tf"
  type              = "ingress"
  from_port         = 3000
  to_port           = 3000
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.engidoor-alb-sg-tf.id
}


/* security group for ECS */
resource "aws_security_group_rule" "engidoor-ecs-sg-rule1-tf" {
  description       = "engidoor-ecs-sg-rule1-tf"
  type              = "ingress"
  from_port         = 8
  to_port           = 0
  protocol          = "icmp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.engidoor-ecs-sg-tf.id
}
resource "aws_security_group_rule" "engidoor-ecs-sg-rule2-tf" {
  description       = "engidoor-ecs-sg-rule2-tf"
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.engidoor-ecs-sg-tf.id
}
resource "aws_security_group_rule" "engidoor-ecs-sg-rule3-tf" {
  description       = "engidoor-ecs-sg-rule3-tf"
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.engidoor-ecs-sg-tf.id
}
resource "aws_security_group_rule" "engidoor-ecs-sg-rule4-tf" {
  description       = "engidoor-ecs-sg-rule4-tf"
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.engidoor-ecs-sg-tf.id
}
resource "aws_security_group_rule" "engidoor-ecs-sg-rule5-tf" {
  description              = "engidoor-ecs-sg-rule5-tf"
  type                     = "ingress"
  from_port                = 0
  to_port                  = 0
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.engidoor-alb-sg-tf.id
  security_group_id        = aws_security_group.engidoor-ecs-sg-tf.id
}
resource "aws_security_group_rule" "engidoor-ecs-sg-rule6-tf" {
  description       = "engidoor-ecs-sg-rule6-tf"
  type              = "ingress"
  from_port         = 3000
  to_port           = 3000
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.engidoor-ecs-sg-tf.id
}
resource "aws_security_group_rule" "engidoor-ecs-sg-rule7-tf" {
  description       = "engidoor-ecs-sg-rule7-tf"
  type              = "ingress"
  from_port         = 5000
  to_port           = 5000
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.engidoor-ecs-sg-tf.id
}
