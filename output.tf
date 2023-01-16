output "web1_public_ip" {
  value = aws_instance.web1.public_ip
}

output "web2-public-ip" {
  value = aws_instance.web2.public_ip
}

output "web3-public-ip" {
  value = aws_instance.web3.public_ip
}

output "alb_dns_name" {
  value = aws_lb.task_alb.dns_name
}