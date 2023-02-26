resource "aws_security_group" "aws_terraform_sg" {
  name = "aws_terraform_sg"
  description = "aws terraform security group"
  vpc_id = aws_vpc.aws_terraform_vpc.id
}

resource "aws_security_group_rule" "aws_terraform_sgr_out_pub" {
  from_port         = 0
  protocol          = "-1"
  security_group_id = aws_security_group.aws_terraform_sg.id
  to_port           = 0
  type              = "egress"
  cidr_blocks = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "aws_terraform_sgr_https_in" {
  from_port         = 443
  protocol          = "tcp"
  security_group_id = aws_security_group.aws_terraform_sg.id
  to_port           = 443
  type              = "ingress"
  cidr_blocks = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "aws_terraform_sgr_ssh_in" {
  from_port         = 22
  protocol          = "tcp"
  security_group_id = aws_security_group.aws_terraform_sg.id
  to_port           = 22
  type              = "ingress"
  cidr_blocks = ["0.0.0.0/0"]
}

resource "aws_key_pair" "aws_terraform_key_pair" {
  key_name = "aws_terraform_key"
  public_key = file("~/.ssh/aws_terraform.pub")
}