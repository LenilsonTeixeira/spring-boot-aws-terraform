# Create a VPC
resource "aws_vpc" "aws_terraform_vpc" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support = true

  tags = {
    "Name" = "aws_terraform_vpc"
  }
}

resource "aws_subnet" "aws_terraform_subnet" {
  vpc_id     = aws_vpc.aws_terraform_vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = true


  tags = {
    Name = "aws_terraform_subnet_pub"
  }
}

resource "aws_internet_gateway" "aws_terraform_gw" {
  vpc_id = aws_vpc.aws_terraform_vpc.id

  tags = {
    Name = "aws_terraform_gw"
  }
}

resource "aws_route_table" "aws_terraform_rtb" {
  vpc_id = aws_vpc.aws_terraform_vpc.id

  tags = {
    Name = "aws_terraform_rtb"
  }
}

resource "aws_route" "aws_terraform_route" {
  route_table_id = aws_route_table.aws_terraform_rtb.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.aws_terraform_gw.id
}

resource "aws_route_table_association" "aws_terraform_rtb_ass" {
  route_table_id = aws_route_table.aws_terraform_rtb.id
  subnet_id = aws_subnet.aws_terraform_subnet.id
}

resource "aws_instance" "aws_terraform_ec2" {
  instance_type = "t2.micro"
  key_name = aws_key_pair.aws_terraform_key_pair.id
  vpc_security_group_ids = [aws_security_group.aws_terraform_sg.id]
  subnet_id = aws_subnet.aws_terraform_subnet.id

  ami = data.aws_ami.aws_terraform_ami.id

  user_data = file("userdata.tpl")

  root_block_device {
    volume_size = 8
  }

  tags = {
    Name = "aws_terraform_ec2"
  }
}