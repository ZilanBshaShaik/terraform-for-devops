module "dev-infra" {
  source         =  "./infra-app"
  env            = "dev"
  bucket_name    = "tws-infra-app"
  instance_count = 1
  instance_type  = "t2.micro"
  ec2_ami_id     = "ami-0e35ddab05955cf57"
  hash_key       = "studentID"
}

module "stage-infra" {
  source         =  "./infra-app"
  env            = "stage"
  bucket_name    = "tws-infra-app"
  instance_count = 1
  instance_type  = "t2.small"
  ec2_ami_id     = "ami-0e35ddab05955cf57"
  hash_key       = "studentID"
}

module "prod-infra" {
  source         =  "./infra-app"
  env            = "prod"
  bucket_name    = "tws-infra-app"
  instance_count = 1
  instance_type  = "t2.medium"
  ec2_ami_id     = "ami-0e35ddab05955cf57"
  hash_key       = "studentID"
}