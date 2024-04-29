variable "vpc_region" {
  type        = string
  description = "Specify that this region will be used to deploy all resources."
  default     = "eu-west-1"
}
variable "vpc_name" {
  type        = string
  description = "The name of the VPC being created. The name must be unique within your AWS account."
  default     = "s208-hanzalah"
}
variable "vpc_cidr" {
  type        = string
  description = "Note the expected CIDR block format (e.g. X.X.X.X/16-28). This variable defines the IPv4 network range for the VPC in CIDR notation (e.g. 10.0.0.0/16)."
  default     = "10.0.0.0/16"
}
variable "availability_zone_1" {
  type        = string
  description = "The Availability Zone where resources will be deployed. This zone must exist in the region specified by the vpc_region variable."
  default     = "eu-west-1a"
}
variable "availability_zone_2" {
  type        = string
  description = "A secondary Availability Zone where resources will be deployed for high availability. This zone must exist in the region specified by the vpc_region variable."
  default     = "eu-west-1b"
}
variable "public_subnet_1" {
  type        = string
  description = "The CIDR block for the first public subnet in the VPC. Public subnets have routes to the internet gateway for public internet access."
  default     = "10.0.101.0/24"
}
variable "public_subnet_2" {
  type        = string
  description = "The CIDR block for the second public subnet in the VPC. Public subnets have routes to the internet gateway for public internet access."
  default     = "10.0.101.0/24"
}
variable "private_subnet_1" {
  type        = string
  description = "The CIDR block for the first private subnet inside the VPC. Private subnets do not have public internet access and require a NAT gateway or NAT instance for internet connectivity."
  default     = "10.0.1.0/24"
}
variable "private_subnet_2" {
  type        = string
  description = "The CIDR block for the second private subnet inside the VPC. Private subnets do not have public internet access and require a NAT gateway or NAT instance for internet connectivity."
  default     = "10.0.2.0/24"
}
variable "enable_nat_gateway" {
  type        = bool
  description = "A boolean to control whether a NAT gateway is provisioned in each availability zone. Enabling this provides internet access to instances in private subnets."
  default     = true
}
variable "single_nat_gateway" {
  type        = bool
  description = "A boolean to control using a single shared NAT gateway or one NAT gateway per availability zone. This variable only applies if enable_nat_gateway is true."
  default     = true
}
variable "one_nat_gateway_per_az" {
  type        = bool
  description = "Create one NAT Gateway per Availability Zone"
  default     = false
}
variable "create_igw" {
  type        = bool
  description = "A boolean to control creation of an internet gateway, which is required to provide internet access to instances in public subnets."
  default     = true
}

variable "db_name" {
  type        = string
  description = "The name of the database to be created. This identifier is unique per region for each AWS account."
  default     = "myrdsinstance"
}
variable "db_identifier" {
  type        = string
  description = "A unique identifier for the database instance. This identifier is used for DNS registration."
  default     = "database-1"
}
variable "db_username" {
  type        = string
  description = "The master username for the database that will be allowed access."
  default     = "myrdsuser"
}

variable "db_engine" {
  type        = string
  description = "The database engine to use, in this case 'mysql'."
  default     = "mysql"
}
variable "db_engine_version" {
  type        = string
  description = "The database engine version, such as '8.0'."
  default     = "8.0"
}
variable "db_instance_class" {
  type        = string
  description = "The database instance type, such as 'db.t3.micro', controlling compute and storage capacity."
  default     = "db.t3.micro"
}
variable "db_subnet_group_name" {
  type        = string
  description = "The name of the database subnet group to use for the database subnets and security group."
  default     = "s208-hanzalah-db-sgn"
}
variable "db_major_engine_version" {
  type        = string
  description = "The major version of the database engine, used to determine compatibility attributes."
  default     = "8.0"
}
variable "db_family" {
  type        = string
  description = "The database family, used to determine the compatibility attributes for certain database features."
  default     = "mysql8.0"
}
variable "cidr_allow_all" {
  type        = string
  description = "The CIDR block to use for open inbound traffic (e.g. 0.0.0.0/0 for all IP addresses)."
  default     = "0.0.0.0/0"
}
variable "rds_security_group" {
  type        = string
  description = "The name of the security group for the RDS database instance. This controls inbound database access."
}
variable "asg_security_group" {
  type        = string
  description = "The name of the security group for EC2 instances launched in the auto scaling group. This controls access to the instances."
}
variable "alb_security_group" {
  type        = string
  description = "The name of the security group for the Application Load Balancer (ALB). This controls access to the load balancer endpoints."
}
variable "key-pair" {
  type        = string
  description = "The name of the SSH key pair to use for accessing EC2 instances launched in the auto scaling group."
  default     = "s208-hanzalah-key"
}
variable "launch_template_name" {
  type        = string
  description = "The name of the launch template defining the EC2 instance configuration for the auto scaling group."
  default     = "s208-hanzalah-template-2"
}
variable "ec2_instance_type" {
  type        = string
  description = "The EC2 instance type or size for instances in the auto scaling group (e.g. t2.micro)."
  default     = "t2.micro"
}
variable "asg_name" {
  type        = string
  description = "The name of the auto scaling group that will launch EC2 instances based on scaling policies."
  default     = "s208-hanzalah-asg"
}
variable "ec2_max_capacity" {
  type        = number
  description = "The maximum number of EC2 instances that can be running in the auto scaling group."
  default     = 2
}
variable "ec2_min_capacity" {
  type        = number
  description = "The minimum number of EC2 instances that must be running in the auto scaling group."
  default     = 1
}
variable "ec2_desired_capacity" {
  type        = number
  description = "The desired capacity is the number of EC2 instances in the auto scaling group that should be maintained."
  default     = 1
}
variable "lb_name" {
  type        = string
  description = "The name of the Application Load Balancer (ALB) that will route traffic to the auto scaling group."
  default     = "s208-hanzalah-alb"
}
variable "lb_target_group_name" {
  type        = string
  description = "The name of the target group attached to the ALB that registers the auto scaling group instances as targets."
  default     = "s208-hanzalah-target-group"
}

variable "domain_name" {
  type        = string
  description = "The domain name to use"
}
variable "my_domain" {
  type        = string
  description = "The specific domain for this environment"
}
variable "scale_up_policy" {
  type        = string
  description = "The auto scaling policy to use for scaling up"
  default     = "add_instance_policy"
}
variable "scale_down_policy" {
  type        = string
  description = "The auto scaling policy to use for scaling down"
  default     = "remove_instance_policy"
}
variable "adjustment_type" {
  type        = string
  description = "Specifies the type of adjustment to be made."
  default     = "ChangeInCapacity"
}
variable "cooldown" {
  type        = number
  description = "The cooldown period in seconds, which is the amount of time to wait before another scaling activity can start."
  default     = 300
}
variable "scale_up_alarm_name" {
  type        = string
  description = "The name of the alarm that triggers scaling up."
  default     = "high_cpu_alarm"
}
variable "scale_down_alarm_name" {
  type        = string
  description = "The name of the alarm that triggers scaling down."
  default     = "low_cpu_alarm"
}
variable "scale_up_alarm_description" {
  type        = string
  description = "The description of the alarm that triggers scaling up."
  default     = "This metric monitors high ec2 cpu utilization"
}
variable "scale_down_alarm_description" {
  type        = string
  description = "The description of the alarm that triggers scaling down."
  default     = "This metric monitors low ec2 cpu utilization"
}
variable "sclae_up_alarm_comparison_operator" {
  type        = string
  description = "The comparison operator used for the scale-up alarm."
  default     = "GreaterThanOrEqualToThreshold"
}
variable "scale_down_alarm_comparison_operator" {
  type        = string
  description = "The comparison operator used for the scale-down alarm."
  default     = "LessThanThreshold"
}
variable "evaluation_periods" {
  type        = number
  description = "The number of periods over which data is compared to the threshold."
  default     = 1
}
variable "period" {
  type        = number
  description = "The duration of each period in seconds."
  default     = 300
}
variable "threshold" {
  type        = number
  description = "The threshold value for the alarm."
  default     = 20
}
variable "metric_name" {
  type        = string
  description = "The name of the metric to monitor."
  default     = "CPUUtilization"
}
variable "namespace" {
  type        = string
  description = "The namespace of the metric."
  default     = "AWS/EC2"
}
variable "statistic" {
  type        = string
  description = "Statistic"
  default     = "The statistic to apply to the metric."
}
