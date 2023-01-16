resource "aws_key_pair" "bastion-key1" {
  key_name   = "bastion-key1"
  public_key = file("~/.ssh/id_rsa.pub")

  tags = merge(
    var.common_tags,
    {
      Name = "TaskKeyPair"
    },
  )
}