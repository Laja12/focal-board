variable "key_name" {
  description = "The name of the key pair to use for the EC2 instance."
  type        = string
  default     = "first-key"
}

variable "ami_id" {
  description = "The AMI ID to use for the EC2 instance"
  type        = string
  default     = "ami-084568db4383264d4"
}

variable "instance_type" {
  description = "Instance type"
  type        = string
  default     = "t3.medium"
}
