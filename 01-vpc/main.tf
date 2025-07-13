module "roboshop" {
  #source = "../terraform-aws-vpc"
  source = "git::https://github.com/Muralisanku/terraform-aws-vpc.git?ref=main"
  project_name = var.project_name
  environment = var.environment
  common_tags = var.common_tags
  vpc_tags = var.vpc_tags

# Public subnet
public_subnets_cidr = var.public_subnets_cidr

# Private subnet
private_subnets_cidr = var.private_subnets_cidr

# database subnet
database_subnets_cidr = var.database_subnets_cidr

is_peering_required = var.is_peering_required

}