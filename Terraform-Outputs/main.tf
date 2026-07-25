
resource "aws_instance" "my-server" {
  ami           = "ami-03793655b06c6e29a"
  instance_type = var.instance_type
  count         = var.instance_count
  tags = {
    Name = "${local.stage_env}-instance"
  }
}

resource "aws_vpc" "test-vpc" {
  cidr_block = "11.5.0.0/16"

  tags = {
    Name = "${local.stage_env}-vpc"
  }
}

resource "aws_subnet" "stage-subnet" {
  vpc_id     = aws_vpc.test-vpc.id
  cidr_block = "11.5.1.0/24"
  tags = {
    Name = "${local.stage_env}-subnet"
  }

}