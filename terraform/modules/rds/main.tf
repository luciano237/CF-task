module "db" {
  source = "terraform-aws-modules/rds/aws"
  # DB-Name
  identifier = "coalfire-stage"

  # Database-Features
  engine               = var.engine_name_rds
  engine_version       = var.engine_version_rds
  instance_class       = var.db_instance_class
  allocated_storage    = var.db_allocated_storage
  storage_type         = var.db_storage_type
  major_engine_version = var.major_engine_version
  family               = var.family
  multi_az             = true
  port                 = var.db_port

  # Database-Credentials 
  db_name  = var.db_instance_name
  username = var.db_instance_username
  password = var.db_instance_password

  # Security-Group
  vpc_security_group_ids = [var.rds_securitygroup_id]

  # Performance Insights
  performance_insights_enabled          = false
  performance_insights_retention_period = 7

  #Backup & maintainance 
  maintenance_window      = "Mon:00:00-Mon:03:00"
  backup_window           = "03:00-06:00"
  backup_retention_period = 0

  # DB subnet group
  create_db_subnet_group = true
  subnet_ids             = var.subnet_ids

  # Database Deletion Protection
  skip_final_snapshot = var.skip_final_snapshot
  deletion_protection = var.deletion_protection

  tags = var.tags
}
