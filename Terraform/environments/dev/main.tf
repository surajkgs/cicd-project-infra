module "vpc_module" {
  source = "./../../modules/vpc_module"
}
module "security_group_module" {
  source     = "./../../modules/security_group_module"
  vpc_id_var = module.vpc_module.vpc_id

}
module "ec2_module" {
  source              = "./../../modules/ec2_module"
  subnet_id_var       = module.vpc_module.public_subnet_id
  security_groups_var = module.security_group_module.security_group_id
  availability_zone_var = module.vpc_module.vpc_public_subnet_az
}

// module "eks_module" {
//   source              = "./../../modules/eks_module"
//   subnet_ids_var       = module.vpc_module.vpc_public_subnet_ids
//   // security_groups_var = module.security_group_module.security_group_id
//   // availability_zone_var = module.vpc_module.vpc_public_subnet_az
// }



// output "security_group_display" {
//     value = module.security_group_module.security_group_id
// }

output "public_subnet_id_display" {
  value = module.vpc_module.public_subnet_id
}
output "public_subnet_ids_display" {
  value = module.vpc_module.vpc_public_subnet_ids
}
// output "vpc_id_display" {
//     value = module.vpc_module.vpc_id
// }
