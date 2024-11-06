variable "project_name" {
  default = "expense"
}
# calling all the varaibles from module
variable "environment" {
  default = "dev"
}

variable "common_tags" {
  default = {
    Project     = "Expense"
    Terraform   = "True"
    Environment = "Dev"
  }
}

variable "mysql_sg_tags" {
  default = {
    component = "mysql"
  }
}

variable "backend_sg_tags" {
  default = {
    component = "backend"
  }
}

variable "frontend_sg_tags" {
  default = {
    component = "frontend"
  }
}

variable "bastion_sg_tags" {
  default = {
    component = "bastion"
  }
}

variable "ansible_sg_tags" {
  default = {
    component = "ansible"
  }
}
