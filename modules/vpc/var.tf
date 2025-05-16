variable "cidr_block" {
  description = "value of cidr block"
  type        = string
  default = "10.0.0.0/16"
}

variable "public_subnet_cidr_1" {
  description = "value of public subnet cidr"
  type = string
  default = "10.0.1.0/24"
}

variable "public_subnet_cidr_2" {
  description = "value of public subnet cidr"
  type = string
  default = "10.0.2.0/24"
}
