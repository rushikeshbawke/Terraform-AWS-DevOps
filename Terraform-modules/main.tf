resource "aws_key_pair" "shared-key" {
  key_name   = "demo-keys"
  public_key = file("C:/Users/RUSHIKESH BAWKE/ssh-key-aws/keys/demo-keys.pub")
}

module "test-webserver" {
  source   = ".//module1"
  key_name = aws_key_pair.shared-key.key_name
}

module "prod-webserver" {
  source   = ".//module2"
  key_name = aws_key_pair.shared-key.key_name
}