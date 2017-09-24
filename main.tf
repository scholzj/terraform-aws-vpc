############
## AWS Provider
############

# Retrieve AWS credentials from env variables AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY
provider "aws" {
  region = "${var.aws_region}"
}

############
## VPC
############

resource "aws_vpc" "vpc" {
  cidr_block = "${var.vpc_cidr}"
  enable_dns_hostnames = true

  tags = "${merge(map("Name", var.vpc_name), var.tags)}"
}

resource "aws_internet_gateway" "gw" {
  vpc_id = "${aws_vpc.vpc.id}"

  tags = "${merge(map("Name", var.vpc_name), var.tags)}"
}

############
## Subnets
############

# Subnet (public)
resource "aws_subnet" "public_subnet" {
  count = "${length(var.aws_zones)}"
  vpc_id = "${aws_vpc.vpc.id}"
  cidr_block = "${cidrsubnet(var.vpc_cidr, 8, count.index)}"
  availability_zone = "${var.aws_zones[count.index]}"
  map_public_ip_on_launch = true

  tags = "${merge(map("Name", format("%v-public-%v", var.vpc_name, var.aws_zones[count.index])), var.tags)}"
}

############
## Routing
############

resource "aws_route_table" "route" {
    vpc_id = "${aws_vpc.vpc.id}"

    # Default route through Internet Gateway
    route {
      cidr_block = "0.0.0.0/0"
      gateway_id = "${aws_internet_gateway.gw.id}"
    }

    tags = "${merge(map("Name", format("%v-route-table", var.vpc_name)), var.tags)}"
}

resource "aws_route_table_association" "route" {
  count = "${length(var.aws_zones)}"
  subnet_id = "${element(aws_subnet.public_subnet.*.id, count.index)}"
  route_table_id = "${aws_route_table.route.id}"
}
