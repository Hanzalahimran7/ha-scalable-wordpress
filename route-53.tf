resource "aws_route53_record" "www" {
  zone_id = data.aws_route53_zone.xldp_domain.zone_id
  name    = var.my_domain
  type    = "A"

  alias {
    name                   = aws_lb.this.dns_name
    zone_id                = aws_lb.this.zone_id
    evaluate_target_health = true
  }
}
