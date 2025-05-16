variable "ami_value" {
  description = "value of ami"
  type        = string
  default     = "ami-084568db4383264d4"
  
}

variable "instance_type" {
  description = "Type of instance to create"
  type        = string
  default     = "t3.medium"
  
}

variable "key_name" {
  description = "The name of the key pair to use for the EC2 instance"
  type        = string
  default     = "first-key"
}
