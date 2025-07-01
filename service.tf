resource "aws_ecs_service" "greanny_services" {
  name                = "greanny-services"
  cluster             = aws_ecs_cluster.my_cluster.id
  task_definition     = aws_ecs_task_definition.greanny_task.arn
  launch_type         = "EC2"
  scheduling_strategy = "REPLICA"
  desired_count       = 1

  network_configuration {
    subnets          = [aws_default_subnet.ecs_az1.id]
    assign_public_ip = false
  }
}
