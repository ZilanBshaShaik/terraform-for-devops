# keypair 
resource "aws_key_pair" "my_key" {
  key_name   = "buildfarm_key_for_ec2_instance"
  public_key = file("buildfarm_key_for_ec2_instance.pub")
}
# VPC & Security Group
resource "aws_default_vpc" "default" {

}

resource "aws_security_group" "my_security_group" {
  name        = "automate-security-group"
  description = "this will be creating a TF generated security group"
  vpc_id      = aws_default_vpc.default.id

  # inbound rules
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "allow SSH connection"
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "allow HTTP connection"
  }

  ingress {
    from_port   = 8000
    to_port     = 8000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "allow Python app connection"
  }

  # outbound rules
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "allow all connection"
  }
}

# ec2 instance
resource "aws_instance" "my_instance" {
  for_each = tomap({
    TWS-Junoon-Automate-Micro  = "t2.micro"
    TWS-Junoon-Automate-Medium = "t2.medium"
    TWS-Junoon-Automate-Small  = "t2.small"
  }) # meta argument
  key_name        = aws_key_pair.my_key.key_name
  security_groups = [aws_security_group.my_security_group.name]
  instance_type   = each.value
  ami             = var.ec2_ami_id
  user_data       = file("install_nginx.sh")

  root_block_device {
    volume_size = var.env == "prd" ? 20 : var.ec2_default_root_storage
    volume_type = "gp3"
  }

  tags = {
    Name        = each.key
    Environment = var.env
  }
}