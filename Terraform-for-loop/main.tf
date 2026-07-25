resource "aws_instance" "test-server" {
  ami           = "ami-03793655b06c6e29a"
  instance_type = "t3.micro"
  tags = {
    Name = "Terraform-instance"
  }
}

resource "aws_iam_user" "test-user" {
  for_each = var.user_names
  name     = each.value
}

# we cannot use list for for_loop. we have to use set and defining the type of variable

variable "user_names" {
  type    = set(string)
  default = ["user1", "user2", "user3"]
}