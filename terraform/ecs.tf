/* クラスター */
resource "aws_ecs_cluster" "engidoor-ecs-cluster-tf" {
  name = "engidoor-ecs-cluster-tf"
}

/* clowdwatch */
resource "aws_cloudwatch_log_group" "for_ecs" {
  name = "/ecs/engidoor"
  retention_in_days = 180
}

/* フロント */
/* タスク定義 */
resource "aws_ecs_task_definition" "engidoor-front-task-tf" {
  family                   = "engidoor-front-task-tf"
  cpu                      = "512"
  memory                   = "1024"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  container_definitions    = file("./tasks/engidoor_front_definition.json")
  task_role_arn            = module.ecs_task_execution_role.iam_role_arn
  execution_role_arn       = module.ecs_task_execution_role.iam_role_arn
}

/* サービス定義 */
resource "aws_ecs_service" "engidoor-front-ecs-service-tf" {
  name                              = "engidoor-front-ecs-service-tf"
  cluster                           = aws_ecs_cluster.engidoor-ecs-cluster-tf.arn
  task_definition                   = "${aws_ecs_task_definition.engidoor-front-task-tf.family}:${max("${aws_ecs_task_definition.engidoor-front-task-tf.revision}", "${data.aws_ecs_task_definition.engidoor-front-task-tf.revision}")}"
  desired_count                     = 1
  launch_type                       = "FARGATE"
  platform_version                  = "1.3.0"
  health_check_grace_period_seconds = 600

  network_configuration {
    assign_public_ip = true
    security_groups = [
      aws_security_group.engidoor-ecs-sg-tf.id
    ]
    subnets = [
      aws_subnet.engidoor-front-subnet-1a-tf.id,
      aws_subnet.engidoor-front-subnet-1c-tf.id
    ]
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.engidoor-alb-front-tg-tf.arn
    container_name   = "engidoor-front-container-tf"
    container_port   = "5000"
  }
}

/* バック側 */
/* タスク定義 */
resource "aws_ecs_task_definition" "engidoor-back-task-tf" {
  family                   = "engidoor-back-task-tf"
  cpu                      = "256"
  memory                   = "512"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  container_definitions    = file("./tasks/engidoor_back_definition.json")
  task_role_arn            = module.ecs_task_execution_role.iam_role_arn
  execution_role_arn       = module.ecs_task_execution_role.iam_role_arn
}

/* サービス定義 */
resource "aws_ecs_service" "engidoor-back-ecs-service-tf" {
  name                              = "engidoor-back-ecs-service-tf"
  cluster                           = aws_ecs_cluster.engidoor-ecs-cluster-tf.arn
  task_definition                   = "${aws_ecs_task_definition.engidoor-back-task-tf.family}:${max("${aws_ecs_task_definition.engidoor-back-task-tf.revision}", "${data.aws_ecs_task_definition.engidoor-back-task-tf.revision}")}"
  desired_count                     = 1
  launch_type                       = "FARGATE"
  platform_version                  = "1.3.0"
  health_check_grace_period_seconds = 600

  network_configuration {
    assign_public_ip = true
    security_groups = [
      aws_security_group.engidoor-ecs-sg-tf.id
    ]
    subnets = [
      aws_subnet.engidoor-back-subnet-1a-tf.id,
      aws_subnet.engidoor-back-subnet-1c-tf.id
    ]
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.engidoor-alb-back-tg-tf.arn
    container_name   = "engidoor-back-container-tf"
    container_port   = "3000"
  }
}

/* IAM Role */
module "ecs_task_execution_role" {
  source     = "./iam_role"
  name       = "ecs-task-execution"
  identifier = "ecs-tasks.amazonaws.com"
  policy     = data.aws_iam_policy_document.ecs_task_execution.json
}

/* マイグレーション用タスク */
resource "aws_ecs_task_definition" "engidoor-db-migrate-tf" {
  family                   = "engidoor-db-migrate-tf"
  container_definitions    = file("./tasks/engidoor_db_migrate_definition.json")
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = "256"
  memory                   = "512"
  execution_role_arn       = module.ecs_task_execution_role.iam_role_arn
}

/* ファミリーを指定するだけで、そのファミリーの最新のACTIVEリビジョンを見つけることができる */
data "aws_ecs_task_definition" "engidoor-front-task-tf" {
  depends_on      = [aws_ecs_task_definition.engidoor-front-task-tf]
  task_definition = aws_ecs_task_definition.engidoor-front-task-tf.family
}
data "aws_ecs_task_definition" "engidoor-back-task-tf" {
  depends_on      = [aws_ecs_task_definition.engidoor-back-task-tf]
  task_definition = aws_ecs_task_definition.engidoor-back-task-tf.family
}


data "aws_iam_policy" "ecs_task_execution_role_policy" {
  arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}

data "aws_iam_policy_document" "ecs_task_execution" {
  source_json = data.aws_iam_policy.ecs_task_execution_role_policy.policy

  statement {
    effect    = "Allow"
    actions   = ["ssm:GetParameters", "kms:Decrypt", "ssmmessages:CreateControlChannel", "ssmmessages:CreateDataChannel", "ssmmessages:OpenControlChannel", "ssmmessages:OpenDataChannel"]
    resources = ["*"]
  }
}

                
                
                