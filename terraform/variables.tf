variable "aws_region" {
  default = "ap-south-1"
}

variable "env" {
  description = "Environment name"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "public_subnets" {
  type = list(string)
}

variable "private_subnets" {
  type = list(string)
}

variable "instance_type" {
  default = "t3.micro"
}

variable "db_username" {}
variable "db_password" {}
