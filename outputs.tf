output "subnet_ids" {
    description = "List with IDs of the public subnets"
    value = "${aws_subnet.public_subnet.*.id}"
}

output "private_subnet_ids" {
    description = "List with IDs of the private subnets"
    value = "${aws_subnet.private_subnet.*.id}"
}

output "vpc_id" {
    description = "ID of the VPC"
    value = "${aws_vpc.vpc.id}"
}