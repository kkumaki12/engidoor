resource "aws_ecr_repository" "engidoor-front-tf" {
  name                 = "engidoor-front-tf"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}
resource "aws_ecr_repository" "engidoor-back-tf" {
  name                 = "engidoor-back-tf"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}
