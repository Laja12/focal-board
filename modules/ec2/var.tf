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

variable "subnet_id" {
  description = "Subnet ID to launch the instance in"
  type        = string
  
}

variable "vpc_id" {
  description = "VPC ID to launch the instance in"
  type        = string
}

variable "key_name" {
  description = "Name of the key pair to use for SSH access"
  type        = string
}

variable "security_group_id" {
  description = "Security group ID to associate with the instance"
  type        = string
}

variable "root_volume_size" {
  description = "The size of the root volume in GB"
  type        = number
  default     = 8
}
