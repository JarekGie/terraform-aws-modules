terraform {
  backend "s3" {
    bucket         = "537124936209-tfstate-bucket"
    key            = "stg/terraform.tfstate"
    region         = "eu-central-1"
    dynamodb_table = "tfstate-bucket"
  }
}
