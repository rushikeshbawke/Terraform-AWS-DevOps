variable "location" {
type = string
description = "region of webserver"
default = "ap-south-1"
}

variable "instance_type" {
type = string
description = "type of instance"
default = "t3.micro"
}

variable "ami_id" {
type = string
description = "ami for server"
default = "ami-01a00762f46d584a1"    # ubuntu machine image
}

variable "key_name" {
type = string
description = "You need to define type of every value you pass through arguments"
}
