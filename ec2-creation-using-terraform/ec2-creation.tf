# key pair to login
resource aws_key_pair my_key {
    key_name = "buildfarm_key_for_ec2_instance"
    public_key = file("buildfarm_key_for_ec2_instance.pub")
}
# VPC & Security group
resource aws_default_vpc default {
}

resource aws_security_group my_security_group {
    name = "automate-security-group"
    description = "this will be added a TF generated security group"
    vpc_id = aws_default_vpc.default.id # interpolcation: extracing a value from a terraform block

# inbound rules
ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "SSH Open"

}
ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "HTTP Open"
}

ingress {
    from_port = 8000
    to_port = 8000
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Open a f/w for an app which runs on port 8000"
}
# outbound rules
egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "all access open outbound"

}
}
# ec2 instance
resource aws_instance "my_instance" {
    key_name = aws_key_pair.my_key.key_name
    security_groups = [aws_security_group.my_security_group.name]
    instance_type = "t2.micro"
    ami = "ami-0e35ddab05955cf57"
    
    root_block_device {
        volume_size = 15
        volume_type = "gp3"
    }

    tags = {
        Name = "TWS-Junnon-automate"
    }
}