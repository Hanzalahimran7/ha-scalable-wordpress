######################################################
#############      VPC         #######################
######################################################
vpc_region             = "eu-west-1"
vpc_name               = "s208-hanzalah"
vpc_cidr               = "10.0.0.0/16"
availability_zone_1    = "eu-west-1a"
availability_zone_2    = "eu-west-1b"
public_subnet_1        = "10.0.101.0/24"
public_subnet_2        = "10.0.102.0/24"
private_subnet_1       = "10.0.1.0/24"
private_subnet_2       = "10.0.2.0/24"
enable_nat_gateway     = true
single_nat_gateway     = true
one_nat_gateway_per_az = false
create_igw             = true

######################################################
#############      RDS         #######################
######################################################
db_name                 = "myrdsinstance"
db_username             = "myrdsuser"
db_identifier           = "database-1"
db_subnet_group_name    = "s208-hanzalah-db-sgn"
db_engine               = "mysql"
db_engine_version       = "8.0"
db_instance_class       = "db.t3.micro"
db_major_engine_version = "8.0"
db_family               = "mysql8.0"

######################################################
#############      Security groups         ###########
######################################################
rds_security_group = "RDS security group"
alb_security_group = "ALB security group"
asg_security_group = "ASG security group"
cidr_allow_all     = "0.0.0.0/0"

######################################################
#############      ASG         #######################
######################################################
key-pair             = "s208-hanzalah-key"
launch_template_name = "s208-hanzalah-template-2"
ec2_instance_type    = "t2.micro"
asg_name             = "s208-hanzalah-asg"
ec2_desired_capacity = 1
ec2_max_capacity     = 2
ec2_min_capacity     = 1
scale_down_policy    = "remove_instance_policy"
scale_up_policy      = "add_instance_policy"
adjustment_type      = "ChangeInCapacity"
cooldown             = 300

######################################################
#############      LB         ########################
######################################################
lb_name              = "s208-hanzalah-alb"
lb_target_group_name = "s208-hanzalah-target-group"

######################################################
#############      Route 53        ###################
######################################################
domain_name = "xldp.xgrid.co"
my_domain   = "hanzalah.xldp.xgrid.co"

######################################################
#############     Cloudwatch Alarms        ###########
######################################################
scale_up_alarm_name                  = "high_cpu_alarm"
scale_up_alarm_description           = "This metric monitors high ec2 cpu utilization"
scale_down_alarm_name                = "low_cpu_alarm"
scale_down_alarm_description         = "This metric monitors low ec2 cpu utilization"
sclae_up_alarm_comparison_operator   = "GreaterThanOrEqualToThreshold"
scale_down_alarm_comparison_operator = "LessThanThreshold"
evaluation_periods                   = 1
period                               = 300
threshold                            = 20
metric_name                          = "CPUUtilization"
namespace                            = "AWS/EC2"
statistic                            = "Average"
