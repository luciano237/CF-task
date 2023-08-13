variable "subnet_ids" {
}
variable "rds_securitygroup_id" {
  description = "Security group for DB"
  type        = string
}
variable "version_db_module" {
  description = "version db"
  type        = string
  default     = "5.2.3"
}
variable "engine_name_rds" {
  description = "Engine name, RDS. PostgreSQL in this case."
  type        = string
  default     = "postgresql"
}
variable "engine_version_rds" {
  description = "Engine Version, 8.0 in this case."
  type        = string
  default     = "8.0"
}
variable "db_instance_class" {
  description = "Instance class for the RDS instance"
  type        = string
  default     = "db.t3.micro"
}
variable "db_allocated_storage" {
  description = "Amount of storage allocated for the RDS instance"
  type        = number
  default     = 5
}
variable "db_storage_type" {
  description = "Type of storage for the RDS instance"
  type        = string
  default     = "gp2"
}
variable "major_engine_version" {
  description = "Major Engine Version, 8.0 in this case."
  type        = string
  default     = "8.0"
}
variable "skip_final_snapshot" {
  description = "Whether to skip creating a final snapshot when deleting the RDS instance"
  type        = bool
  default     = true
}
variable "family" {
  description = "Family of the DB"
  type        = string
  default     = "postgresql8.0"
}
variable "db_instance_name" {
  description = "Name for the RDS instance"
  type        = string
  default     = "coalfireStageDB"
}
variable "db_instance_username" {
  description = "Username for the RDS instance"
  type        = string
  default     = "admin"
}

variable "db_instance_password" {
  description = "Password for the RDS instance"
  type        = string
}
variable "deletion_protection" {
  description = "Whether to skip creating a final snapshot when deleting the RDS instance"
  type        = bool
  default     = false
}
variable "db_port" {
  type    = string
  default = "3306"
}
variable "tags" {
  type = map(string)
  default = {
    Project = "coalfire"
    env     = "stage"
  Terraform = true }
}