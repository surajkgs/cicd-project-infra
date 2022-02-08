
variable "eks_cluster_name_var" {
    type = string
    description = "(optional) describe your variable"
    default = "lear_eks_cluster"
}
variable "k8s_version_var" {
  default     = "1.21"
  type        = string
  description = "Required K8s version"
}
variable "subnet_ids_var" {
  type = list
  description = "(optional) describe your variable"
}

variable "node_instance_type_var" {
  type = string
  description = "(optional) describe your variable"
  default = "t2.micro"
}