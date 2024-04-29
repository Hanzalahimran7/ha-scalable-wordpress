## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.43.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.43.0 |
| <a name="provider_local"></a> [local](#provider\_local) | 2.5.1 |
| <a name="provider_tls"></a> [tls](#provider\_tls) | 4.0.5 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_acm"></a> [acm](#module\_acm) | terraform-aws-modules/acm/aws | ~> 4.0 |
| <a name="module_db"></a> [db](#module\_db) | terraform-aws-modules/rds/aws | n/a |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | terraform-aws-modules/vpc/aws | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_autoscaling_attachment.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_attachment) | resource |
| [aws_autoscaling_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_group) | resource |
| [aws_autoscaling_policy.scale_down](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_policy) | resource |
| [aws_autoscaling_policy.scale_up](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_policy) | resource |
| [aws_cloudwatch_metric_alarm.high_cpu](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_cloudwatch_metric_alarm.low_cpu](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_key_pair.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/key_pair) | resource |
| [aws_launch_template.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/launch_template) | resource |
| [aws_lb.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb) | resource |
| [aws_lb_listener.http_listener](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener) | resource |
| [aws_lb_listener.https_listener](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener) | resource |
| [aws_lb_listener_rule.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener_rule) | resource |
| [aws_lb_target_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group) | resource |
| [aws_route53_record.www](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_security_group.alb_sg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group.asg_sg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group.rds_sg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [local_file.this](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file) | resource |
| [tls_private_key.rsa](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/private_key) | resource |
| [aws_ami.amazon-linux-2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami) | data source |
| [aws_route53_zone.xldp_domain](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/route53_zone) | data source |
| [aws_secretsmanager_secret.secrets](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/secretsmanager_secret) | data source |
| [aws_secretsmanager_secret_version.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/secretsmanager_secret_version) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_adjustment_type"></a> [adjustment\_type](#input\_adjustment\_type) | Specifies the type of adjustment to be made. | `string` | `"ChangeInCapacity"` | no |
| <a name="input_alb_security_group"></a> [alb\_security\_group](#input\_alb\_security\_group) | The name of the security group for the Application Load Balancer (ALB). This controls access to the load balancer endpoints. | `string` | n/a | yes |
| <a name="input_asg_name"></a> [asg\_name](#input\_asg\_name) | The name of the auto scaling group that will launch EC2 instances based on scaling policies. | `string` | `"s208-hanzalah-asg"` | no |
| <a name="input_asg_security_group"></a> [asg\_security\_group](#input\_asg\_security\_group) | The name of the security group for EC2 instances launched in the auto scaling group. This controls access to the instances. | `string` | n/a | yes |
| <a name="input_availability_zone_1"></a> [availability\_zone\_1](#input\_availability\_zone\_1) | The Availability Zone where resources will be deployed. This zone must exist in the region specified by the vpc\_region variable. | `string` | `"eu-west-1a"` | no |
| <a name="input_availability_zone_2"></a> [availability\_zone\_2](#input\_availability\_zone\_2) | A secondary Availability Zone where resources will be deployed for high availability. This zone must exist in the region specified by the vpc\_region variable. | `string` | `"eu-west-1b"` | no |
| <a name="input_cidr_allow_all"></a> [cidr\_allow\_all](#input\_cidr\_allow\_all) | The CIDR block to use for open inbound traffic (e.g. 0.0.0.0/0 for all IP addresses). | `string` | `"0.0.0.0/0"` | no |
| <a name="input_cooldown"></a> [cooldown](#input\_cooldown) | The cooldown period in seconds, which is the amount of time to wait before another scaling activity can start. | `number` | `300` | no |
| <a name="input_create_igw"></a> [create\_igw](#input\_create\_igw) | A boolean to control creation of an internet gateway, which is required to provide internet access to instances in public subnets. | `bool` | `true` | no |
| <a name="input_db_engine"></a> [db\_engine](#input\_db\_engine) | The database engine to use, in this case 'mysql'. | `string` | `"mysql"` | no |
| <a name="input_db_engine_version"></a> [db\_engine\_version](#input\_db\_engine\_version) | The database engine version, such as '8.0'. | `string` | `"8.0"` | no |
| <a name="input_db_family"></a> [db\_family](#input\_db\_family) | The database family, used to determine the compatibility attributes for certain database features. | `string` | `"mysql8.0"` | no |
| <a name="input_db_identifier"></a> [db\_identifier](#input\_db\_identifier) | A unique identifier for the database instance. This identifier is used for DNS registration. | `string` | `"database-1"` | no |
| <a name="input_db_instance_class"></a> [db\_instance\_class](#input\_db\_instance\_class) | The database instance type, such as 'db.t3.micro', controlling compute and storage capacity. | `string` | `"db.t3.micro"` | no |
| <a name="input_db_major_engine_version"></a> [db\_major\_engine\_version](#input\_db\_major\_engine\_version) | The major version of the database engine, used to determine compatibility attributes. | `string` | `"8.0"` | no |
| <a name="input_db_name"></a> [db\_name](#input\_db\_name) | The name of the database to be created. This identifier is unique per region for each AWS account. | `string` | `"myrdsinstance"` | no |
| <a name="input_db_subnet_group_name"></a> [db\_subnet\_group\_name](#input\_db\_subnet\_group\_name) | The name of the database subnet group to use for the database subnets and security group. | `string` | `"s208-hanzalah-db-sgn"` | no |
| <a name="input_db_username"></a> [db\_username](#input\_db\_username) | The master username for the database that will be allowed access. | `string` | `"myrdsuser"` | no |
| <a name="input_domain_name"></a> [domain\_name](#input\_domain\_name) | The domain name to use | `string` | n/a | yes |
| <a name="input_ec2_desired_capacity"></a> [ec2\_desired\_capacity](#input\_ec2\_desired\_capacity) | The desired capacity is the number of EC2 instances in the auto scaling group that should be maintained. | `number` | `1` | no |
| <a name="input_ec2_instance_type"></a> [ec2\_instance\_type](#input\_ec2\_instance\_type) | The EC2 instance type or size for instances in the auto scaling group (e.g. t2.micro). | `string` | `"t2.micro"` | no |
| <a name="input_ec2_max_capacity"></a> [ec2\_max\_capacity](#input\_ec2\_max\_capacity) | The maximum number of EC2 instances that can be running in the auto scaling group. | `number` | `2` | no |
| <a name="input_ec2_min_capacity"></a> [ec2\_min\_capacity](#input\_ec2\_min\_capacity) | The minimum number of EC2 instances that must be running in the auto scaling group. | `number` | `1` | no |
| <a name="input_enable_nat_gateway"></a> [enable\_nat\_gateway](#input\_enable\_nat\_gateway) | A boolean to control whether a NAT gateway is provisioned in each availability zone. Enabling this provides internet access to instances in private subnets. | `bool` | `true` | no |
| <a name="input_evaluation_periods"></a> [evaluation\_periods](#input\_evaluation\_periods) | The number of periods over which data is compared to the threshold. | `number` | `1` | no |
| <a name="input_key-pair"></a> [key-pair](#input\_key-pair) | The name of the SSH key pair to use for accessing EC2 instances launched in the auto scaling group. | `string` | `"s208-hanzalah-key"` | no |
| <a name="input_launch_template_name"></a> [launch\_template\_name](#input\_launch\_template\_name) | The name of the launch template defining the EC2 instance configuration for the auto scaling group. | `string` | `"s208-hanzalah-template-2"` | no |
| <a name="input_lb_name"></a> [lb\_name](#input\_lb\_name) | The name of the Application Load Balancer (ALB) that will route traffic to the auto scaling group. | `string` | `"s208-hanzalah-alb"` | no |
| <a name="input_lb_target_group_name"></a> [lb\_target\_group\_name](#input\_lb\_target\_group\_name) | The name of the target group attached to the ALB that registers the auto scaling group instances as targets. | `string` | `"s208-hanzalah-target-group"` | no |
| <a name="input_metric_name"></a> [metric\_name](#input\_metric\_name) | The name of the metric to monitor. | `string` | `"CPUUtilization"` | no |
| <a name="input_my_domain"></a> [my\_domain](#input\_my\_domain) | The specific domain for this environment | `string` | n/a | yes |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | The namespace of the metric. | `string` | `"AWS/EC2"` | no |
| <a name="input_one_nat_gateway_per_az"></a> [one\_nat\_gateway\_per\_az](#input\_one\_nat\_gateway\_per\_az) | Create one NAT Gateway per Availability Zone | `bool` | `false` | no |
| <a name="input_period"></a> [period](#input\_period) | The duration of each period in seconds. | `number` | `300` | no |
| <a name="input_private_subnet_1"></a> [private\_subnet\_1](#input\_private\_subnet\_1) | The CIDR block for the first private subnet inside the VPC. Private subnets do not have public internet access and require a NAT gateway or NAT instance for internet connectivity. | `string` | `"10.0.1.0/24"` | no |
| <a name="input_private_subnet_2"></a> [private\_subnet\_2](#input\_private\_subnet\_2) | The CIDR block for the second private subnet inside the VPC. Private subnets do not have public internet access and require a NAT gateway or NAT instance for internet connectivity. | `string` | `"10.0.2.0/24"` | no |
| <a name="input_public_subnet_1"></a> [public\_subnet\_1](#input\_public\_subnet\_1) | The CIDR block for the first public subnet in the VPC. Public subnets have routes to the internet gateway for public internet access. | `string` | `"10.0.101.0/24"` | no |
| <a name="input_public_subnet_2"></a> [public\_subnet\_2](#input\_public\_subnet\_2) | The CIDR block for the second public subnet in the VPC. Public subnets have routes to the internet gateway for public internet access. | `string` | `"10.0.101.0/24"` | no |
| <a name="input_rds_security_group"></a> [rds\_security\_group](#input\_rds\_security\_group) | The name of the security group for the RDS database instance. This controls inbound database access. | `string` | n/a | yes |
| <a name="input_scale_down_alarm_comparison_operator"></a> [scale\_down\_alarm\_comparison\_operator](#input\_scale\_down\_alarm\_comparison\_operator) | The comparison operator used for the scale-down alarm. | `string` | `"LessThanThreshold"` | no |
| <a name="input_scale_down_alarm_description"></a> [scale\_down\_alarm\_description](#input\_scale\_down\_alarm\_description) | The description of the alarm that triggers scaling down. | `string` | `"This metric monitors low ec2 cpu utilization"` | no |
| <a name="input_scale_down_alarm_name"></a> [scale\_down\_alarm\_name](#input\_scale\_down\_alarm\_name) | The name of the alarm that triggers scaling down. | `string` | `"low_cpu_alarm"` | no |
| <a name="input_scale_down_policy"></a> [scale\_down\_policy](#input\_scale\_down\_policy) | The auto scaling policy to use for scaling down | `string` | `"remove_instance_policy"` | no |
| <a name="input_scale_up_alarm_description"></a> [scale\_up\_alarm\_description](#input\_scale\_up\_alarm\_description) | The description of the alarm that triggers scaling up. | `string` | `"This metric monitors high ec2 cpu utilization"` | no |
| <a name="input_scale_up_alarm_name"></a> [scale\_up\_alarm\_name](#input\_scale\_up\_alarm\_name) | The name of the alarm that triggers scaling up. | `string` | `"high_cpu_alarm"` | no |
| <a name="input_scale_up_policy"></a> [scale\_up\_policy](#input\_scale\_up\_policy) | The auto scaling policy to use for scaling up | `string` | `"add_instance_policy"` | no |
| <a name="input_sclae_up_alarm_comparison_operator"></a> [sclae\_up\_alarm\_comparison\_operator](#input\_sclae\_up\_alarm\_comparison\_operator) | The comparison operator used for the scale-up alarm. | `string` | `"GreaterThanOrEqualToThreshold"` | no |
| <a name="input_single_nat_gateway"></a> [single\_nat\_gateway](#input\_single\_nat\_gateway) | A boolean to control using a single shared NAT gateway or one NAT gateway per availability zone. This variable only applies if enable\_nat\_gateway is true. | `bool` | `true` | no |
| <a name="input_statistic"></a> [statistic](#input\_statistic) | Statistic | `string` | `"The statistic to apply to the metric."` | no |
| <a name="input_threshold"></a> [threshold](#input\_threshold) | The threshold value for the alarm. | `number` | `20` | no |
| <a name="input_vpc_cidr"></a> [vpc\_cidr](#input\_vpc\_cidr) | Note the expected CIDR block format (e.g. X.X.X.X/16-28). This variable defines the IPv4 network range for the VPC in CIDR notation (e.g. 10.0.0.0/16). | `string` | `"10.0.0.0/16"` | no |
| <a name="input_vpc_name"></a> [vpc\_name](#input\_vpc\_name) | The name of the VPC being created. The name must be unique within your AWS account. | `string` | `"s208-hanzalah"` | no |
| <a name="input_vpc_region"></a> [vpc\_region](#input\_vpc\_region) | Specify that this region will be used to deploy all resources. | `string` | `"eu-west-1"` | no |

## Outputs

No outputs.
