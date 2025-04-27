output "ec2_instance_public_ip" {
  value = [
    for key in aws_instance.my_instance : key.public_ip
  ]
}

output "ec2_instance_dns" {
  value = [
    for key in aws_instance.my_instance : key.public_dns
  ]
}

output "ec2_instance_private_ip" {
  value = [
    for key in aws_instance.my_instance : key.private_ip
  ]
}