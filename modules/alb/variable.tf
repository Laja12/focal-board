variable "vpc_id" {
  description = "VPC ID to launch the instance in"
  type        = string
  
}
variable "subnets" {
  description = "List of subnet IDs to associate with the ALB"
  type        = list(string)
}

variable "alb_security_group_id" {
  description = "The security group ID for the ALB"
  type        = string
}

variable "instance_id" {
  description = "The ID of the instance to attach to the target group"
  type        = string
}
