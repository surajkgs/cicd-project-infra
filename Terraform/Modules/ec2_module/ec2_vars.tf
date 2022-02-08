variable  "instance_name_var" {
    type = string
    default = "lear_ec2"
}
variable  "key_pair_name_var" {
    type = string
    default = "suraj-key-pair"
}
variable  "subnet_id_var" {
    type = string
}
variable  "security_groups_var" {
    type = string
}

variable "availability_zone_var" {
  type = string
}