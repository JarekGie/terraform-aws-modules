variable "bucket" {
  description = "Unique name for bucket"
}
variable "prevent_destroy" {
  type    = bool
  default = false
}
variable "region" {
  description = "Default region for remote state bucket"
}
variable "dynamodb_table_name" {
  description = "Name for state lock dynamodb table"
}

