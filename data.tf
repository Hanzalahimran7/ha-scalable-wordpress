data "aws_ami" "amazon-linux-2" {
  most_recent = true
  filter {
    name   = "owner-alias"
    values = ["amazon"]
  }
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}

data "aws_route53_zone" "xldp_domain" {
  name = var.domain_name
}

data "aws_secretsmanager_secret" "secrets" {
  arn = module.db.db_instance_master_user_secret_arn
}

data "aws_secretsmanager_secret_version" "current" {
  secret_id = data.aws_secretsmanager_secret.secrets.id
}
