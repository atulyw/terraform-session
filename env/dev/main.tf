provider "aws" {
  region  = "eu-west-1"
  profile = "terraform-session"
}

module "vpc" {
  source                   = "../../modules/vpc"
  service_name             = "iata"
  env                      = "dev"
  cidr_block               = "10.0.0.0/16"
  public_subnet_cidr_block = ["10.0.1.0/24", "10.0.2.0/24"]
  #                                  0              1     
  private_subnet_cidr_block = ["10.0.3.0/24", "10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
  #                                   0             1             2                   3
  availability_zones = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
  tags = {
    owner        = "cloudblitz"
    billing-unit = "iata"
    po           = "air-2.4"
  }
}