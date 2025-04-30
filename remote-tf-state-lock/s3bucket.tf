resource "aws_s3_bucket" "remote_s3" {
  bucket = "tws-junoon-state-bucket-remote"

  lifecycle {
    prevent_destroy = false
  }

  tags = {
    Name = "tws-junoon-state-bucket-remote"
  }
}

# terraform destroy -auto-apprve unable to delete the bucket hecne we need to run below commands to empty bucket
# aws s3 rm s3://tws-junoon-state-bucket-remote --recursive
# aws s3api delete-bucket --bucket tws-junoon-state-bucket-remote