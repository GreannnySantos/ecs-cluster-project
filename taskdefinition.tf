resource "aws_ecs_task_definition" "greanny_task" {
  family                   = "greanny-task"
  requires_compatibilities = ["EC2"]
  network_mode             = "awsvpc"
  cpu                      = "256"
  memory                   = "512"
  execution_role_arn       = aws_iam_role.ecsTaskExecutionRole.arn

  container_definitions = jsonencode([
    {
      name      = "greanny-task",
      image     = "${aws_ecr_repository.greanny_ecr_repo.repository_url}:latest",
      essential = true,
      portMappings = [
        {
          containerPort = 80,
          hostPort      = 80
        }
      ],
      memory = 512,
      cpu    = 256
    }
  ])
}
