resource "aws_vpc" "main" {
  cidr_block           = var.cidr_block
  instance_tenancy     = var.instance_tenancy
  enable_dns_support   = var.enable_dns_support
  enable_dns_hostnames = var.enable_dns_hostnames
  tags                 = merge(var.tags, tomap({"Name" = format("%s-%s-vpc", var.service_name, var.env)}))
  
}

resource "aws_subnet" "public" {
  count                   = length(var.public_subnet_cidr_block) #2
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnet_cidr_block[count.index]
  availability_zone       = element(var.availability_zones, count.index)
  map_public_ip_on_launch = true
  tags                    = merge(var.tags, {"type" = "public"}, tomap({"Name" = format("%s-%s-public-subnet", var.service_name, var.env)}))
}

resource "aws_subnet" "private" {
  count                   = length(var.private_subnet_cidr_block)
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.private_subnet_cidr_block[count.index]
  availability_zone       = element(var.availability_zones, count.index)
  map_public_ip_on_launch = false
  tags                    = merge(var.tags, {"type" = "public"}, tomap({"Name" = format("%s-%s-private-subnet", var.service_name, var.env)}))
}