provider "aws" {
  region                   = var.location
  shared_credentials_files = ["C:/Users/RUSHIKESH BAWKE/.aws/credentials"]
}

resource "aws_instance" "my-server-1" {
ami = var.ami_id
instance_type = var.instance_type
subnet_id = aws_subnet.public-subnet.id 
key_name      = var.key_name 
vpc_security_group_ids = [aws_security_group.test-sg.id]
tags = {
Name = "Test-webserver-1"
}

user_data = <<-EOF
  #!/bin/bash
  sudo apt-get update -y
  sudo apt-get install -y apache2
  sudo systemctl start apache2
  sudo systemctl enable apache2
  sudo chown -R ubuntu:ubuntu /var/www/html
  echo "<html><body><h1>Hello this is module-1</h1></body></html>" | sudo tee /var/www/html/index.html
EOF
}

resource "aws_vpc" "test-vpc" {
cidr_block = "11.5.0.0/16"
enable_dns_support = true
enable_dns_hostnames = true
tags = {
Name = "Test-vpc"
}
}

resource "aws_subnet" "public-subnet" {
vpc_id = aws_vpc.test-vpc.id
cidr_block = "11.5.1.0/24"
availability_zone = "ap-south-1a"
map_public_ip_on_launch = true
tags = {
Name = "Public-subnet-test"
}
}

resource "aws_internet_gateway" "test-igw" {
vpc_id = aws_vpc.test-vpc.id
tags = {
name = "Test-igw"
}
}

resource "aws_route_table" "test-rt" {
vpc_id = aws_vpc.test-vpc.id
route {
cidr_block = "0.0.0.0/0"
gateway_id = aws_internet_gateway.test-igw.id
}
tags = {
Name = "Public-rt-test"
}
}

resource "aws_route_table_association" "public" {
subnet_id = aws_subnet.public-subnet.id
route_table_id = aws_route_table.test-rt.id
}

resource "aws_security_group" "test-sg" {
vpc_id = aws_vpc.test-vpc.id
tags = {
Name = "test-sg"
}

ingress {
cidr_blocks = ["0.0.0.0/0"]
from_port = 80
to_port = 80
protocol = "tcp"
description = "http requests"
ipv6_cidr_blocks = []
prefix_list_ids = []
}

ingress {
cidr_blocks = ["0.0.0.0/0"]
from_port = 22
to_port = 22
protocol = "tcp"
description = "SSH connection i put from specific id which is my system"
ipv6_cidr_blocks = []
prefix_list_ids = []
}

egress {
cidr_blocks = ["0.0.0.0/0"]
from_port = 0
to_port = 0
protocol = "-1"      # -1 is define as access to all protocol at once like tcp, icmp, udp
description = "outbond traffic"
self = false         # prevents the traffic from same security group members
}
}
