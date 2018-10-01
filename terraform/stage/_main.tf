/*====
Variables used across all modules
======*/
locals {
  stage_availability_zones = ["us-east-1a", "us-east-1b"]
}

provider "aws" {
  region = "${var.region}"
}

terraform {
  required_version = "0.11.8"

  backend "s3" {
    bucket         = "terraform-state-storage-a123z67"
    key            = "stage/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = "true"
    dynamodb_table = "terraform-state-lock-dynamo"
  }
}

module "networking" {
  source               = "../modules/networking"
  environment          = "stage"
  vpc_cidr             = "10.0.0.0/16"
  public_subnets_cidr  = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets_cidr = ["10.0.10.0/24", "10.0.20.0/24"]
  region               = "${var.region}"
  availability_zones   = "${local.stage_availability_zones}"
}

module "ecs" {
  source             = "../modules/ecs"
  teaser_docker_image= "${var.teaser_docker_image}"
  environment        = "stage"
  vpc_id             = "${module.networking.vpc_id}"
  availability_zones = "${local.stage_availability_zones}"
  repository_name    = "teaser/stage"
  subnets_ids        = ["${module.networking.private_subnets_id}"]
  public_subnet_ids  = ["${module.networking.public_subnets_id}"]

  security_groups_ids = [
    "${module.networking.security_groups_ids}",
  ]
}
