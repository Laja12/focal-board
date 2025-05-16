terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.0.0"
    }
  }
}
provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source = "./modules/vpc"
  
}

module "ec2" {
  source = "./modules/ec2"
  ami_value = var.ami_value
  instance_type = var.instance_type
  subnet_id = length(module.vpc.subnet_ids) > 0 ? module.vpc.subnet_ids[0] : null
  vpc_id = module.vpc.vpc_id
  security_group_id = module.sg.alb_sg_id
  key_name = var.key_name

  depends_on = [module.sg]
}

module "alb" {
  source = "./modules/alb"
  vpc_id = module.vpc.vpc_id
  subnets = module.vpc.subnet_ids
  alb_security_group_id = module.sg.alb_sg_id
  instance_id = module.ec2.instance_id
}

module "sg" {
  source = "./modules/security_group"
  vpc_id = module.vpc.vpc_id
}
