resource "aws_instance" "web1" {
  ami                    = "ami-0b5eea76982371e91"
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.subnet_us_east_1a.id
  vpc_security_group_ids = [aws_security_group.allow_ssh.id, aws_security_group.allow_http.id]
  key_name               = "bastion-key1"
  user_data              = <<-EOF
              #!/bin/bash
              yum install httpd -y
              service httpd start
              chkconfig httpd on
              echo "Hello, world" > /var/www/html/index.html
              EOF

  tags = merge(
    var.common_tags,
    {
      Name = "web1"
    },
  )
}



resource "aws_instance" "web2" {
  ami                    = "ami-0b5eea76982371e91"
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.subnet_us_east_1b.id
  vpc_security_group_ids = [aws_security_group.allow_ssh.id, aws_security_group.allow_http.id]
  key_name               = "bastion-key1"
  user_data              = <<-EOF
              #!/bin/bash
              yum install httpd -y
              service httpd start
              chkconfig httpd on
              echo "Hello, world" > /var/www/html/index.html
              EOF

  tags = merge(
    var.common_tags,
    {
      Name = "web2"
    },
  )
}

resource "aws_instance" "web3" {
  ami                    = "ami-0b5eea76982371e91"
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.subnet_us_east_1c.id
  vpc_security_group_ids = [aws_security_group.allow_ssh.id, aws_security_group.allow_http.id]
  key_name               = "bastion-key1"
  user_data              = <<-EOF
              #!/bin/bash
              yum install httpd -y
              service httpd start
              chkconfig httpd on
              echo "Hello, world" > /var/www/html/index.html
              EOF

  tags = merge(
    var.common_tags,
    {
      Name = "web3"
    },
  )
}