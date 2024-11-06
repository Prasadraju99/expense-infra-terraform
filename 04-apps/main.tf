# mysql ec2 instance
module "mysql" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  ami = local.ami_id
  name = "${local.resource_name}-mysql"

  instance_type          = "t3.micro"
  vpc_security_group_ids = [locals.mysql_sg_id]
  subnet_id              = local.database_subnet_id

  tags = merge(
    var.common_tags,
    var.mysql_tags,
    {
        Name = "${local.resource_name}-mysql"
    }
  )
}
# backend ec2 instance
module "backend" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  ami = local.ami_id
  name = "${local.resource_name}-backend"

  instance_type          = "t3.micro"
  vpc_security_group_ids = [locals.backend_sg_id]
  subnet_id              = local.private_subnet_id

  tags = merge(
    var.common_tags,
    var.backend_tags,
    {
        Name = "${local.resource_name}-backend"
    }
  )
}
# frontend ec2 instance
module "frontend" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  ami = local.ami_id
  name = "${local.resource_name}-frontend"

  instance_type          = "t3.micro"
  vpc_security_group_ids = [locals.frontend_sg_id]
  subnet_id              = local.public_subnet_id

  tags = merge(
    var.common_tags,
    var.frontend_tags,
    {
        Name = "${local.resource_name}-frontend"
    }
  )
}
# ansible ec2 instance
module "ansible" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  ami = local.ami_id
  name = "${local.resource_name}-ansible"

  instance_type          = "t3.micro"
  vpc_security_group_ids = [locals.ansible_sg_id]
  subnet_id              = local.public_subnet_id
  user_data = file("expense.sh")

  tags = merge(
    var.common_tags,
    var.ansible_tags,
    {
        Name = "${local.resource_name}-ansible"
    }
  )
}

module "records" {
  source  = "terraform-aws-modules/route53/aws//modules/records"
  version = "~> 3.0"

  zone_name = var.zone_name

  records = [
    {
      name    = "mysql"
      type    = "A"
      ttl     = 3600
      records = [
        module.mysql.private_ip
      ]
    },
    {
      name    = "backend"
      type    = "A"
      ttl     = 3600
      records = [
        module.backend.private_ip
      ]
    },
      {
      name    = ""
      type    = "A"
      ttl     = 3600
      records = [
        module.frontend.public_ip
      ]
    },
  ]
  # depends_on = [module.zones]
}