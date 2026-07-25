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