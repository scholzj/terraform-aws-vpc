# Terraform module for Amazon AWS VPC

This Terraform module creates:
* Amazon AWS VPC
* Internet Gateway
* Subnets in all configured availability zones and routing tables linking them to the Internet Gateway

This module is used in my own confguration. If you just want to create a VPC, go to [this GitHub repo](https://github.com/scholzj/aws-vpc).

## Including as a module

This repository should be included as a module into your own configuration. An example of how to include this can be found in the [examples](examples/) dir. 
