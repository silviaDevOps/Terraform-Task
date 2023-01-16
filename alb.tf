resource "aws_lb" "task_alb" {
  name               = "task-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.allow_http.id]
  subnets            = [aws_subnet.subnet_us_east_1a.id, aws_subnet.subnet_us_east_1b.id, aws_subnet.subnet_us_east_1c.id]

  tags = merge(
    var.common_tags,
    {
      Name = "Task-ALB"
    },
  )
}

resource "aws_lb_target_group" "task_tg" {
  name     = "task-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.task_vpc.id

  tags = merge(
    var.common_tags,
    {
      Name = "TaskTG"
    },
  )
}

resource "aws_lb_target_group_attachment" "web1_tg" {
  target_group_arn = aws_lb_target_group.task_tg.arn
  target_id        = aws_instance.web1.id
  port             = 80
}

resource "aws_lb_target_group_attachment" "web2_tg" {
  target_group_arn = aws_lb_target_group.task_tg.arn
  target_id        = aws_instance.web2.id
  port             = 80
}

resource "aws_lb_target_group_attachment" "web3_tg" {
  target_group_arn = aws_lb_target_group.task_tg.arn
  target_id        = aws_instance.web3.id
  port             = 80
}

resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.task_alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.task_tg.arn
  }
}