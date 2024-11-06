module "ec2_instance" {
  source = "terraform-aws-modules/ec2-instance/aws"

  ami  = local.ami_id
  name = local.resource_name

  instance_type          = "t3.micro"
  vpc_security_group_ids = [locals.backend_sg_id]
  subnet_id              = local.public_subnet_ids

  tags = merge(
    var.common_tags,
    var.bastion_tags,
    {
      Name = local.resource_name
    }
  )
}