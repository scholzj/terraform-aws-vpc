output "subnet_ids" {
    value = "${aws_subnet.public_subnet.*.id}"
}

output "vpc_id" {
    value = "${aws_vpc.vpc.id}"
}