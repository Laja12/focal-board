terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source = "./modules/vpc"
}

module "security_group" {
  source  = "./modules/security_group"
  vpc_id  = module.vpc.vpc_id
}

module "ec2" {
  source              = "./modules/ec2"
  subnet_id           = module.vpc.subnet_ids[0]
  security_group_id   = module.security_group.web_security_group_id
  key_name            = var.key_name
  ami_id              = var.ami_id
  instance_type       = var.instance_type
}


module "alb" {
  source             = "./modules/alb"
  vpc_id             = module.vpc.vpc_id
  subnet_ids         = module.vpc.subnet_ids
  alb_security_group_id = module.security_group.lb_security_group_id
  instance_id        = module.ec2.instance_id
}
