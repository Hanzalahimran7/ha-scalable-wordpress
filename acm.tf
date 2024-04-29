module "acm" {
  source                 = "terraform-aws-modules/acm/aws"
  version                = "~> 4.0"
  domain_name            = var.my_domain
  zone_id                = data.aws_route53_zone.xldp_domain.zone_id
  validation_method      = "DNS"
  create_route53_records = true
  wait_for_validation    = true
}
