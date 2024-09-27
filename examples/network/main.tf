module "vpc" {
  source = "../../modules/network"

  region             = "eu-central-1"
  project_name       = "test"
  cidr               = "10.0.0.0/16"
  public_subnets     = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets    = ["10.0.3.0/24", "10.0.4.0/24"]
  availability_zones = ["eu-central-1a", "eu-central-1b"]
  enable_nat_gateway = false
  tags = {
    Environment = "production"
  }
}

