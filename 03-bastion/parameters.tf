resource "aws_ssm_parameter" "mysql_sg_id" {
  # /expense/dev/mysql_sg_id
  name  = "/${var.project_name}/${var.environment}/mysql_sg_id"
  type  = "String"
  value = module.mysql_sg_id
}

resource "aws_ssm_parameter" "backend_sg_id" {
   # /expense/dev/backend_sg_id
  name  = "/${var.project_name}/${var.environment}/backend_sg_id"
  type  = "String"
  value = module.backend_sg_id
}

resource "aws_ssm_parameter" "backend_sg_id" {
  # /expense/dev/frontend_sg_id
  name  = "/${var.project_name}/${var.environment}/frontend_sg_id"
  type  = "String"
  value = module.frontend_sg_id
}

resource "aws_ssm_parameter" "bastion_sg_id" {
  # /expense/dev/bastion_sg_id
  name  = "/${var.project_name}/${var.environment}/bastion_sg_id"
  type  = "String"
  value = module.bastion_sg_id
}