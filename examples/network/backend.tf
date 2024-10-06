terraform {
  backend "s3" {
    bucket         = "820242946329-testowy-bucket-ernesta"
    key            = "stg/terraform.tfstate"
    region         = "eu-central-1"
    dynamodb_table = "testowy-bucket-ernesta"
  }
}
