resource "aws_internet_gateway" "engidoor-igw-tf" {
  vpc_id = aws_vpc.engidoor-vpc-tf.id

  tags = {
    Name = "engidoor-igw-tf"
  }
}
