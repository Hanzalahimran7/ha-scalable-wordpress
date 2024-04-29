// The module provisions RDS instance and uses db_config from Variables
module "db" {
  source                      = "terraform-aws-modules/rds/aws"
  identifier                  = var.db_identifier           //The name of the RDS instance
  engine                      = var.db_engine               //The database engine to use
  engine_version              = var.db_engine_version       // The engine version to use
  instance_class              = var.db_instance_class       // The instance type of the RDS instance
  allocated_storage           = 20                          // The allocated storage in gigabytes
  max_allocated_storage       = 100                         // Specifies the value for Storage Autoscaling
  major_engine_version        = var.db_major_engine_version // The major version of the database engine
  family                      = var.db_family               // The family of the database engine
  db_name                     = var.db_name
  username                    = var.db_username
  port                        = 3306
  manage_master_user_password = true                       // Determines whether or not to manage the master user password
  create_db_subnet_group      = true                       // Determines whether or not to create a subnet group
  subnet_ids                  = module.vpc.private_subnets // A list of VPC subnet IDs where Database can reside
  multi_az                    = true
  vpc_security_group_ids      = [aws_security_group.rds_sg.id] // List of VPC security groups to associate
  deletion_protection         = false                          // The database can't be deleted when this value is set to true
  skip_final_snapshot         = true                           // Determines whether a final DB snapshot is created before the DB instance is deleted.
}
