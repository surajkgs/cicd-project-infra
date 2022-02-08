variable "vpc_cidr_block_var" {
  type = string
  default = "10.0.0.0/16"
}
variable "vpc_name_var" {
  type = string
  default = "lear-vpc"
}

variable "availability_zone_var" {
  type = list
  default = ["eu-west-1a","eu-west-1b"]
}


variable "private_subnet_names" {
  type = list
  default = [ "lear_private_subnet1" ]
}
variable "public_subnet_names" {
  type = list
  default = [ "lear_public_subne1","lear_public_subnet2" ]
}
variable "private_subnet_cidr" {
  type = list
  default = [ "10.0.1.0/24" ]
}
variable "public_subnet_cidr" {
  type = list
  default = [ "10.0.2.0/24","10.0.4.0/24" ]
}


variable "ig_var" {
  type = string
  default = "lear_ig"
}
