resource "aws_vpc" "task_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = merge(
    var.common_tags,
    {
      Name = "Task-VPC"
    },
  )
}

resource "aws_internet_gateway" "task_ig" {
  vpc_id = aws_vpc.task_vpc.id

  tags = merge(
    var.common_tags,
    {
      Name = "Task-IG"
    },
  )
}

resource "aws_route" "route" {
  route_table_id         = aws_vpc.task_vpc.default_route_table_id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.task_ig.id
}

resource "aws_subnet" "subnet_us_east_1a" {
  vpc_id     = aws_vpc.task_vpc.id
  cidr_block = "10.0.1.0/24"

  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = merge(
    var.common_tags,
    {
      Name = "subnet-us-east-1a"
    },
  )
}

resource "aws_subnet" "subnet_us_east_1b" {
  vpc_id     = aws_vpc.task_vpc.id
  cidr_block = "10.0.2.0/24"

  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true

  tags = merge(
    var.common_tags,
    {
      Name = "subnet-us-east-1b"
    },
  )
}

resource "aws_subnet" "subnet_us_east_1c" {
  vpc_id     = aws_vpc.task_vpc.id
  cidr_block = "10.0.3.0/24"

  availability_zone       = "us-east-1c"
  map_public_ip_on_launch = true

  tags = merge(
    var.common_tags,
    {
      Name = "subnet-us-east-1c"
    },
  )
}