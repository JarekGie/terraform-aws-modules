# terraform-aws-modules

Reusable Terraform modules for AWS infrastructure. Each module is standalone and can be sourced independently.

## Modules

### `modules/network`

Creates a VPC with public and private subnets, Internet Gateway, NAT Gateway, and Elastic IP.

**Problems it solves:** Eliminates the boilerplate of setting up a standard VPC layout. NAT Gateway is optional — disable it to reduce costs in dev environments.

**Usage:**

```hcl
module "vpc" {
  source = "github.com/JarekGie/terraform-aws-modules//modules/network?ref=0.0.12"

  project_name       = "my-project"
  region             = "eu-west-1"
  cidr               = "10.0.0.0/16"
  public_subnets     = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets    = ["10.0.3.0/24", "10.0.4.0/24"]
  availability_zones = ["eu-west-1a", "eu-west-1b"]
  enable_nat_gateway = true

  tags = {
    Environment = "production"
  }
}
```

**Outputs:** `vpc_id`, `public_subnet_ids`, `private_subnet_ids`

---

### `modules/remote_state`

Creates an S3 bucket (versioned, encrypted, public access blocked) and DynamoDB table for Terraform state locking. Bucket name is automatically prefixed with the AWS account ID.

**Problems it solves:** Bootstrapping remote state before any other Terraform code runs. Handles naming uniqueness across accounts without manual input.

**Usage:**

```hcl
module "remote_state" {
  source = "github.com/JarekGie/terraform-aws-modules//modules/remote_state?ref=0.0.11"

  bucket              = "my-tfstate-bucket"
  dynamodb_table_name = "my-tfstate-lock"
  region              = "eu-west-1"
}
```

**Outputs:** `bucket_id`, `bucket_arn`, `aws_caller_identity_id`

**Requires:** Terraform >= 1.5.0, AWS provider >= 5.46.0

---

## What this repo does NOT contain

- Multi-account or Organizations setup
- EKS, RDS, or application-layer modules
- Environment-specific configurations (prod/staging/dev)
- Opinionated CI/CD pipelines ready for copy-paste

## Examples

Working usage examples are in `examples/network/` and `examples/remote_state/`. They reference specific module versions via git tags — pin to a tag in production.
