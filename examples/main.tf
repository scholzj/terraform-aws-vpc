module "vpc" {
  source = "../"

  aws_region = "eu-central-1"
  aws_zones = ["eu-central-1a", "eu-central-1b", "eu-central-1c"]
  vpc_name = "example-vpc"
  vpc_cidr = "10.0.0.0/16"

  ## Tags
  tags = {
    Hello = "World"
  }
}

output "vpc" {
  value = "${module.vpc.vpc_id}"
}

output "subnets" {
  value = "${module.vpc.subnet_ids}"
}