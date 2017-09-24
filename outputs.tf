output "subnet_id" {
    count = "${length(var.aws_zones)}"
    value = "${element(aws_subnet.public_subnet.*.id, count.index)}"
}