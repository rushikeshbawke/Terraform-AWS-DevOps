provider "aws" {
  region                   = var.location
  shared_credentials_files = ["C:/Users/RUSHIKESH BAWKE/.aws/credentials"]
}

locals {
  stage_env = "staging"
}

resource "aws_instance" "My-server" {
  ami           = "ami-03793655b06c6e29a"
  instance_type = var.instance_type
  count         = var.instance_count
  tags = {
    Name = "${local.stage_env}-server"
  }
}

resource "aws_vpc" "test_vpc" {
  cidr_block = "11.5.0.0/16"

  tags = {
    Name = "${local.stage_env}-vpc"
  }
}

resource "aws_subnet" "subnet-1" {
  vpc_id     = aws_vpc.test_vpc.id
  cidr_block = "11.5.1.0/24"

  tags = {
    Name = "${local.stage_env}-subnet"
  }
}