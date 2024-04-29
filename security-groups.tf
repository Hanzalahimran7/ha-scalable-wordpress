// Security group for VPC
resource "aws_security_group" "rds_sg" {
  name   = var.rds_security_group
  vpc_id = module.vpc.vpc_id
  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = [module.vpc.vpc_cidr_block]
  }
}

// Security group for ALB
resource "aws_security_group" "alb_sg" {
  name   = var.alb_security_group
  vpc_id = module.vpc.vpc_id
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [var.cidr_allow_all]
  }
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [var.cidr_allow_all]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = [var.cidr_allow_all]
  }
}

// Security group for ASG
resource "aws_security_group" "asg_sg" {
  name   = var.asg_security_group
  vpc_id = module.vpc.vpc_id
  ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.alb_sg.id]
  }
  ingress {
    from_port       = 443
    to_port         = 443
    protocol        = "tcp"
    security_groups = [aws_security_group.alb_sg.id]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = [var.cidr_allow_all]
  }
}
