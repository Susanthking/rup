provider "aws" {
  region = "us-west-2"
}

module "ses" {
  source = "./modules/ses"
}

module "lambda" {
  source = "./modules/lambda"
}

module "redis" {
  source = "./modules/redis"
}

module "sftp" {
  source = "./modules/sftp"
}

module "efs" {
  source = "./modules/efs"
}

module "ec2" {
  source = "./modules/ec2"
}
