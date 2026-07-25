variable "instance_type" {
  type        = string
  description = "instnace tpe should be in default"
  default     = "t3.micro"
}

variable "location" {
  type        = string
  description = "region in which we have to setup the servers"
  default     = "ap-south-1"
}

variable "instance_count" {
  type        = number
  description = "how many instances wnat to deploy"
  default     = 1
}

variable "user_names" {
  type        = list(string)
  description = "IAM usernames"
  default     = ["user1", "user2", "user3"]
}