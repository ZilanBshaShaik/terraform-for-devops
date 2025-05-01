variable "env" {
  description = "This is my environment for my infra"
  type        = string
}

variable "bucket_name" {
  description = "This is bucket name for my infra"
  type        = string
}

variable "instance_count" {
  description = "This is the number of ec2 instance count"
  type        = number
}

variable "instance_type" {
  description = "This is the instance type for my ec2 infra"
  type        = string
}

variable "ec2_ami_id" {
  description = "This is the AWS ami id for my infra"
  type        = string
}

variable "hash_key" {
  description = "This is the hash key for my dynamodb infra"
  type        = string
}

variable "ec2_default_root_storage" {
  description = "This is default storage for ec2"
  type = number
  default = 10
}