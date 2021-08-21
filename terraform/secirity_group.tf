/* security group for RDS */
resource "aws_security_group" "engidoor-rds-sg-tf" {
  description = "RDS security group for engidoor tf"
  name        = "engidoor-rds-sg-tf"
  vpc_id      = aws_vpc.engidoor-vpc-tf.id
}

/* security group for ALB */
resource "aws_security_group" "engidoor-alb-sg-tf" {
  description = "ALB security group for engidoor tf"
  name        = "engidoor-alb-sg-tf"
  vpc_id      = aws_vpc.engidoor-vpc-tf.id
}

/* security group for ECS */
resource "aws_security_group" "engidoor-ecs-sg-tf" {
  description = "ECS security group for engidoor tf"
  name        = "engidoor-ecs-sg-tf"
  vpc_id      = aws_vpc.engidoor-vpc-tf.id
}
