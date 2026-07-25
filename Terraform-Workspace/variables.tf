variable "location" {
  type        = string
  description = "Region of instance"
  default     = "ap-south-1"
}

variable "instance_type" {
  type        = string
  description = "type of instance"
  default     = "t3.micro"
}