
variable "instance_type" {
  type        = string
  description = "Instance type"
}

variable "tag" {
  type        = string
  description = "Tag for EC2 instance"
}

variable "location" {
  type        = string
  description = "Region of instance"
}
