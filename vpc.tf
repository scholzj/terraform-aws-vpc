############
## VPC
############

resource "aws_vpc" "vpc" {
  cidr_block = "${var.vpc_cidr}"
  enable_dns_hostnames = true

  tags = "${merge(map("Name", var.vpc_name), var.tags)}"

  # tags {
  #   Name = "${var.vpc_name}"
  #   Owner = "${var.tags["Owner"]}"
  #   Application = "${var.tags["Application"]}"
  #   Confidentiality = "${var.tags["Confidentiality"]}"
  #   Costcenter = "${var.tags["CostCenter"]}"
  # }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = "${aws_vpc.vpc.id}"

  tags = "${merge(map("Name", var.vpc_name), var.tags)}"

  # tags {
  #   Name = "${var.vpc_name}"
  #   Owner = "${var.tags["Owner"]}"
  #   Application = "${var.tags["Application"]}"
  #   Confidentiality = "${var.tags["Confidentiality"]}"
  #   Costcenter = "${var.tags["CostCenter"]}"
  # }
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

  # tags {
  #   Name = "${var.vpc_name}-public-${var.aws_zones[count.index]}"
  #   Owner = "${var.tags["Owner"]}"
  #   Application = "${var.tags["Application"]}"
  #   Confidentiality = "${var.tags["Confidentiality"]}"
  #   Costcenter = "${var.tags["CostCenter"]}"
  # }
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

    # tags {
    #   Name = "${var.vpc_name}-route-table"
    #   Owner = "${var.tags["Owner"]}"
    #   Application = "${var.tags["Application"]}"
    #   Confidentiality = "${var.tags["Confidentiality"]}"
    #   Costcenter = "${var.tags["CostCenter"]}"
    # }
}

resource "aws_route_table_association" "route" {
  count = "${length(var.aws_zones)}"
  subnet_id = "${element(aws_subnet.public_subnet.*.id, count.index)}"
  route_table_id = "${aws_route_table.route.id}"
}
