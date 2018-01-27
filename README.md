# Terraform module for Amazon AWS VPC

This Terraform module creates:

* Amazon AWS VPC
* Internet Gateway
* Subnets in all configured availability zones and routing tables linking them to the Internet Gateway (public subnets)

Additionally, if variable `private_subnets` is set to true, it will create:

* NAT with Elastic IP address in each availability zone
* Private subnet in each availability zone with routing tables linking them to the NAT

This module is used in my own confguration. If you just want to create a VPC, go to [this GitHub repo](https://github.com/scholzj/aws-vpc).

## Including as a module

This repository should be included as a module into your own configuration. An example of how to include this can be found in the [examples](examples/) dir. 
