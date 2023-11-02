provider "aws" {
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  region     = "us-east-1"

}

# Cluster
resource "aws_ecs_cluster" "aws-ecs-D6cluster" {
  name = "urlapp-cluster"
  tags = {
    Name = "D6bank-cluster"
  }
}

resource "aws_cloudwatch_log_group" "D6log-group" {
  name = "/ecs/bank-logs"

  tags = {
    Application = "D6bank-app"
  }
}

# Task Definition

resource "aws_ecs_task_definition" "aws-ecs-D6task" {
  family = "D6bank-task"

  container_definitions = <<EOF
  [
  {
      "name": "D6bank-container",
      "image": "tsanderson77/bankapp11:latest",
      "logConfiguration": {
        "logDriver": "awslogs",
        "options": {
          "awslogs-group": "/ecs/bank-logs",
          "awslogs-region": "us-east-1",
          "awslogs-stream-prefix": "ecs"
        }
      },
      "portMappings": [
        {
          "containerPort": 8000
        }
      ]
    }
  ]
  EOF

  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  memory                   = "1024"
  cpu                      = "512"
  execution_role_arn       = "arn:aws:iam::347142919260:role/ecsTaskExecutionRole"
  task_role_arn            = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"

}

# ECS Service
resource "aws_ecs_service" "aws-ecs-D6service" {
  name                 = "D6bank-ecs-service"
  cluster              = aws_ecs_cluster.aws-ecs-D6cluster.id
  task_definition      = aws_ecs_task_definition.aws-ecs-D6task.arn
  launch_type          = "FARGATE"
  scheduling_strategy  = "REPLICA"
  desired_count        = 2
  force_new_deployment = true

  network_configuration {
    subnets = [
      aws_subnet.private_a.id,
      aws_subnet.private_b.id
    ]
    assign_public_ip = false
    security_groups  = [aws_security_group.ingress_app.id]
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.bank-app.arn
    container_name   = "D6bank-container"
    container_port   = 8000
  }

}

