output "subnet_ids" {
    description = "List with IDs of the subnets"
    value = "${aws_subnet.public_subnet.*.id}"
}

output "vpc_id" {
    description = "ID of the VPC"
    value = "${aws_vpc.vpc.id}"
}