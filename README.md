# Amazon AWS VPC

This Terraform configuration creates:
* Amazon AWS VPC
* Internet Gateway
* Subnets in all configured availability zones and routing tables linking them to the Internet Gateway

<!-- TOC -->

- [Amazon AWS VPC](#amazon-aws-vpc)
    - [Prerequisites and dependencies](#prerequisites-and-dependencies)
    - [Standalone usage](#standalone-usage)
        - [Configuration](#configuration)
        - [Creating the VPC](#creating-the-vpc)
        - [Deleting the VPC](#deleting-the-vpc)
    - [Including as a module](#including-as-a-module)

<!-- /TOC -->

## Prerequisites and dependencies

There are no other dependencies apart from [Terraform](https://www.terraform.io).

## Standalone usage
### Configuration

| Option | Explanation | Example |
|--------|-------------|---------|
| `aws_region` | AWS region which should be used | `eu-central-1` |
| `aws_zones` | List of AWS availability zones which should be used | `["eu-central-1a", "eu-central-1b"]` |
| `vpc_name` | Name of the VPC which should ve created | `my-vpc` |
| `vpc_cidr` | CIDR address which should be used | `10.0.0.0/16` |
| `tags` | Tags which should be applied to all resources | `{ Hello = "World" }` |

### Creating the VPC

To create the VPC, 
* Export AWS credentials into environment variables `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY`
* Apply Terraform configuration:
```bash
terraform init
terraform apply --var-file example.tfvars
```

### Deleting the VPC

To delete the VPC, 
* Export AWS credentials into environment variables `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY`
* Destroy Terraform configuration:
```bash
terraform init
terraform destroy --var-file example.tfvars
```

## Including as a module

This repository can be also included as a module into your own configuration. And example of how to include this can be found in the [examples](examples/) dir.