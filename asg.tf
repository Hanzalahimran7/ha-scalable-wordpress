// Create Private Key for EC2
resource "tls_private_key" "rsa" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

// Create key pair for EC2
resource "aws_key_pair" "this" {
  key_name   = var.key-pair
  public_key = tls_private_key.rsa.public_key_openssh
}

// Create a local file for key/value pair
resource "local_file" "this" {
  content  = tls_private_key.rsa.private_key_pem
  filename = "${var.key-pair}.pem"
}

// Launch template for EC2 instance
resource "aws_launch_template" "this" {
  name                   = var.launch_template_name
  image_id               = data.aws_ami.amazon-linux-2.id
  instance_type          = var.ec2_instance_type
  key_name               = var.key-pair
  vpc_security_group_ids = [aws_security_group.asg_sg.id]
  // User data script to configure instance
  user_data = base64encode(templatefile("${path.module}/script.sh", {
    DB_NAME     = var.db_name
    DB_USER     = var.db_username
    DB_PASSWORD = jsondecode(data.aws_secretsmanager_secret_version.current.secret_string)["password"]
    DB_HOST     = module.db.db_instance_endpoint
  }))
}

// Autoscaling group for EC2 instances
resource "aws_autoscaling_group" "this" {
  name                = var.asg_name
  max_size            = var.ec2_max_capacity
  min_size            = var.ec2_min_capacity
  desired_capacity    = var.ec2_desired_capacity
  vpc_zone_identifier = module.vpc.private_subnets
  launch_template {
    id = aws_launch_template.this.id
  }
  force_delete = true
}

// Attach ASG to load balancer target group
resource "aws_autoscaling_attachment" "this" {
  autoscaling_group_name = aws_autoscaling_group.this.id
  lb_target_group_arn    = aws_lb_target_group.this.arn
}

resource "aws_autoscaling_policy" "scale_up" {
  name                   = var.scale_up_policy
  scaling_adjustment     = 1
  adjustment_type        = var.adjustment_type
  cooldown               = var.cooldown
  autoscaling_group_name = aws_autoscaling_group.this.name
}

resource "aws_autoscaling_policy" "scale_down" {
  name                   = var.scale_down_policy
  scaling_adjustment     = -1
  adjustment_type        = var.adjustment_type
  cooldown               = var.cooldown
  autoscaling_group_name = aws_autoscaling_group.this.name
}
