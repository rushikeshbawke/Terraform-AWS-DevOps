# 1. Define the Provider
provider "aws" {
  access_key = "Paste your access key here"
  secret_key = "tpaste your secrete key here"
  region     = "ap-south-1" # matches your current region
}

# 2. Define the Resource
resource "aws_instance" "my_server" {
<<<<<<< HEAD
  ami           = "ami-03793655b06c6e29a" # choose valid AMI for your region
  instance_type = "t3.micro"
=======
  ami             = "ami-03793655b06c6e29a" # choose valid AMI for your region
  instance_type   = "t3.micro"
>>>>>>> c300096a4af07048f1bd40927dae616bdc0d7e4e
  tags = {
    Name = "Terraform-Instance"
  }
}
