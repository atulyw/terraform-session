variable "cidr_block" {
  type        = string
  description = "cidr block for vpc"
}

variable "instance_tenancy" {
  type    = string
  default = "default"
}

variable "enable_dns_support" {
  type    = string
  default = true

}
variable "enable_dns_hostnames" {
  type    = string
  default = false

}

variable "public_subnet_cidr_block" {
  type = list(any)
}

variable "private_subnet_cidr_block" {
  type = list(any)
}

variable "availability_zones" {
  type = list(any)
}

variable "tags" {
  type = map(any)
}

variable "service_name" {
  type = string
}

variable "env" {
 type = string 
}