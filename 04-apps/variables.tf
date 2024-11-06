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

variable "mysql_tags" {
  default = {
    component = "mysql"
  }
}

variable "backend_tags" {
  default = {
    component = "backend"
  }
}

variable "frontend_tags" {
  default = {
    component = "frontend"
  }
}

variable "ansible_tags" {
  default = {
    component = "ansible"
  }
}

variable "zone_name" {
  default = "prasadking.xyz"
}

