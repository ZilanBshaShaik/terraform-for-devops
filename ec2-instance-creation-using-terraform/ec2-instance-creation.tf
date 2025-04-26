# keypair
resource aws_key_pair my_key {
    key_name = "buildfarm_key_for_ec2_instance"
    public_key = file("buildfarm_key_for_ec2_instance.pub")
}

# VPC and Security Group
resource aws_default_vpc default {
}

resource aws_security_group my_security_group {
    name = "automate-security-group"
    description = "this will be added TF generated security group"
    vpc_id = aws_default_vpc.default.id


# inboud rules
ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "allow SSH"
}

ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "allow HTTP port"
}

ingress {
    from_port = 8000
    to_port = 8000
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "for python application"
}

# outbound rules
egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "all access to open outbond"
}
}
# ec2 instance
resource aws_instance my_instace {
    key_name = aws_key_pair.my_key.key_name
    security_groups = [aws_security_group.my_security_group.name]
    instance_type = "t2.micro"
    ami = "ami-0e35ddab05955cf57"

    root_block_device {
        volume_size = 15
        volume_type = "gp3"
    }

    tags = {
        Name = "tws-junnon-automate"
    }
}