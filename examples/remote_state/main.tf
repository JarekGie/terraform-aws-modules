module "remote_state" {
  source              = "github.com/JarekGie/terraform-aws-modules//modules/remote_state?ref=0.0.11"
  bucket              = var.bucket
  dynamodb_table_name = var.dynamodb_table_name
  region              = var.region
}
