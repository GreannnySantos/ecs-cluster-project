resource "aws_ecr_repository" "greanny_ecr_repo" {
  name = "greanny-ecr-repo"
  tags = {
    Name="latest_ecr"
  }
}