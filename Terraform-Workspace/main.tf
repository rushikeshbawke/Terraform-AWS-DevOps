resource "aws_instance" "my-server" {
  ami           = "ami-03793655b06c6e29a"
  instance_type = var.instance_type
  tags = {
    Name = local.instance_name
  }
}

locals {
  instance_name = "${terraform.workspace}-server"
}

# $ terraform workspace list => shows all workspaces present
# $ terraform workspace new dev => it will add new workspace and switch the added one directly
# $ terraform workspace select dev => it will switch the workspace to dev
# $ terraform workspace show => it will show the active workspace
# $ i created dev.tfvars, test.tfvars, prod.tfvars which are holding variables location and instance_type
# $ then pass it like this $ terraform apply -var-file="dev.tfvars"