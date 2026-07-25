
provider "aws" {
  region                   = var.location
  shared_credentials_files = ["C:/Users/RUSHIKESH BAWKE/.aws/credentials"]
}

resource "aws_instance" "my_server" {

  ami           = "ami-03793655b06c6e29a"
  instance_type = var.instance_type

  tags = {
    Name = var.tag
  }
}
