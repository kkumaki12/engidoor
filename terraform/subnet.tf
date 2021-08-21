resource "aws_subnet" "engidoor-front-subnet-1a-tf" {
  vpc_id                  = aws_vpc.engidoor-vpc-tf.id
  cidr_block              = "10.10.1.0/24"
  availability_zone       = "ap-northeast-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "engidoor-front-subnet-1a-tf"
  }
}
resource "aws_subnet" "engidoor-front-subnet-1c-tf" {
  vpc_id                  = aws_vpc.engidoor-vpc-tf.id
  cidr_block              = "10.10.2.0/24"
  availability_zone       = "ap-northeast-1c"
  map_public_ip_on_launch = true

  tags = {
    Name = "engidoor-front-subnet-1c-tf"
  }
}
resource "aws_subnet" "engidoor-back-subnet-1a-tf" {
  vpc_id                  = aws_vpc.engidoor-vpc-tf.id
  cidr_block              = "10.10.3.0/24"
  availability_zone       = "ap-northeast-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "engidoor-back-subnet-1a-tf"
  }
}
resource "aws_subnet" "engidoor-back-subnet-1c-tf" {
  vpc_id                  = aws_vpc.engidoor-vpc-tf.id
  cidr_block              = "10.10.4.0/24"
  availability_zone       = "ap-northeast-1c"
  map_public_ip_on_launch = true

  tags = {
    Name = "engidoor-back-subnet-1c-tf"
  }
}

resource "aws_db_subnet_group" "engidoor-rds-subnet-group-tf" {
  name        = "engidoor-rds-subnet-group-tf"
  description = "rds subnet for engidoor-tf"
  subnet_ids  = [aws_subnet.engidoor-back-subnet-1a-tf.id, aws_subnet.engidoor-back-subnet-1c-tf.id]
}
