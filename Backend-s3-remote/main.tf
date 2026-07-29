#First run the bootstrap file for s3 bucket

terraform {
  backend "s3" {
    bucket       = "rushi-tf-s3-bucket"
    key          = "rushi/terraform/remote/s3/terraform.tfstate"
    region       = "ap-south-1"
    encrypt      = true
    use_lockfile = true
  }
}

resource "aws_instance" "ec2_example" {

  ami           = "ami-03793655b06c6e29a"
  instance_type = var.instance_type
  tags = {
    Name = "EC2 Instance with remote state"
  }
}

/* 

It is chances of blocking your process becuase already .tflock file is created by Bootstrap.

To unlock their are 2 options

option-1 
$ terraform force-unlock dc169373-0ed6-ae6e-5d94-e50e443b9815
Use the exact Lock ID from your error output. Terraform will ask to confirm, then remove the lock.

Option-2 
Go into the S3 bucket console and delete the .tflock object sitting next to your state file:
rushi/terraform/remote/s3/terraform.tfstate.tflock
Delete only the .tflock file — never delete terraform.tfstate itself.

*/