variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

variable "subnet_ids" {
  description = "A list of subnet IDs"
  type        = list(string)
}

variable "alb_security_group_id" {
  description = "The security group ID for the ALB"
  type        = string
}

variable "instance_id" {
  description = "The ID of the EC2 instance"
  type        = string
}
