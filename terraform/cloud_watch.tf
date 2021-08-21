resource "aws_cloudwatch_log_group" "engidoor-ecs-back-tf" {
  name              = "/ecs/back-tf"
  retention_in_days = 180
}
resource "aws_cloudwatch_log_group" "engidoor-ecs-front-tf" {
  name              = "/ecs/front-tf"
  retention_in_days = 180
}
resource "aws_cloudwatch_log_group" "engidoor-ecs-db-migrate-tf" {
  name              = "/ecs/db-migrate-tf"
  retention_in_days = 180
}
