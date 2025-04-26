# create a file locally using terraform

# terraform block
#<block> <parameters> {
#    arguments
#}

resource local_file my_file {
    filename = "terraform-automation.txt"
    content = "learning terraform from TWS"
}

# to create a file locally we need to apply terraform principle
# terraform init
# terraform validate
# terraform plan
# terraform apply (-auto-approve to overcome manual approval while creation)
# terraform destroy