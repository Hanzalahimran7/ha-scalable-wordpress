module "vpc" {
  source             = "terraform-aws-modules/vpc/aws"
  name               = var.vpc_name
  cidr               = var.vpc_cidr
  azs                = [var.availability_zone_1, var.availability_zone_2]
  private_subnets    = [var.private_subnet_1, var.private_subnet_2]
  public_subnets     = [var.public_subnet_1, var.public_subnet_2]
  enable_nat_gateway = var.enable_nat_gateway
  single_nat_gateway = var.single_nat_gateway
  create_igw         = var.create_igw
  tags = {
    Name : var.vpc_name
  }
}
