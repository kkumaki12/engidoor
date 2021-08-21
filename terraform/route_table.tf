resource "aws_route_table" "Table_for_engidoor-tf" {
  vpc_id = aws_vpc.engidoor-vpc-tf.id
}


resource "aws_route_table" "engidoor-front-route-tf" {
  vpc_id = aws_vpc.engidoor-vpc-tf.id

  route {
    gateway_id = aws_internet_gateway.engidoor-igw-tf.id
    cidr_block = "0.0.0.0/0"
  }

  tags = {
    Name = "engidoor-front-route-tf"
  }
}
resource "aws_route_table" "engidoor-back-route-tf" {
  vpc_id = aws_vpc.engidoor-vpc-tf.id

  route {
    gateway_id = aws_internet_gateway.engidoor-igw-tf.id
    cidr_block = "0.0.0.0/0"
  }

  tags = {
    Name = "engidoor-back-route-tf"
  }
}


resource "aws_route_table_association" "engidoor-front-route-1a-tf" {
  subnet_id      = aws_subnet.engidoor-front-subnet-1a-tf.id
  route_table_id = aws_route_table.engidoor-front-route-tf.id
}
resource "aws_route_table_association" "engidoor-front-route-1c-tf" {
  subnet_id      = aws_subnet.engidoor-front-subnet-1c-tf.id
  route_table_id = aws_route_table.engidoor-front-route-tf.id
}
resource "aws_route_table_association" "engidoor-back-route-1a-tf" {
  subnet_id      = aws_subnet.engidoor-back-subnet-1a-tf.id
  route_table_id = aws_route_table.engidoor-back-route-tf.id
}
resource "aws_route_table_association" "engidoor-back-route-1c-tf" {
  subnet_id      = aws_subnet.engidoor-back-subnet-1c-tf.id
  route_table_id = aws_route_table.engidoor-back-route-tf.id
}
