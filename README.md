# Amazon AWS VPC

This Terraform configuration creates:
* Amazon AWS VPC
* Internet Gateway
* Subnets in all configured availability zones and routing tables linking them to the Internet Gateway

## Prerequisites and dependencies

There are no other dependencies apart from [Terraform](https://www.terraform.io).

## Configuration

| Option | Explanation | Example |
|--------|-------------|---------|
| `aws_region` | AWS region which should be used | `eu-central-1` |
| `aws_zones` | List of AWS availability zones which should be used | `["eu-central-1a", "eu-central-1b"]` |
| `vpc_name` | Name of the VPC which should ve created | `my-vpc` |
| `vpc_cidr` | CIDR address which should be used | `10.0.0.0/16` |
| `tags` | Tags which should be applied to all resources | `{ Hello = "World" }` |

## Creating the VPC

To create the VPC, 
* Export AWS credentials into environment variables `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY`
* Apply Terraform configuration:
```bash
terraform apply
```