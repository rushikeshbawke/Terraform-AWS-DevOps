variable "instance_type" {
  type        = string
  description = "instance type should be mention in default"
  default     = "t3.micro"
}

variable "location" {
  type        = string
  description = "region where we want to deploy servers"
  default     = "ap-south-1"
}

variable "instance_count" {
  type        = number
  description = "the count is in number so type would also change"
  default     = 1
}