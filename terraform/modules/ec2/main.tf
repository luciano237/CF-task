
resource "random_string" "test_suffix" {
  length           = 6
  special          = false
  override_special = "-"
  upper            = false
}

module "ec2_instance" {

  source = "terraform-aws-modules/ec2-instance/aws"
  name   = var.instance_name

  ami               = data.aws_ami.ubuntu.id
  availability_zone = var.availability_zone
  instance_type     = var.ec2_instance_type

  associate_public_ip_address = var.associate_public_ip_address
  monitoring                  = var.monitoring
  ebs_optimized               = var.ebs_optimized

  key_name               = var.key_pair_key_name
  vpc_security_group_ids = [var.instance_sg_id]
  subnet_id              = var.vpc_details

  tags = var.tags
}

resource "aws_volume_attachment" "this" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.this.id
  instance_id = module.ec2_instance.id
}

resource "aws_ebs_volume" "this" {
  size = var.storage_size

  tags = local.tags
}