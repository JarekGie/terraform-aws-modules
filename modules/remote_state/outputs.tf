output "id" {
  description = "The id of the bucket"
  value       = aws_s3_bucket.terraform_state.id
}
output "bucket_arn" {
  description = "The arn of the bucket"
  value       = aws_s3_bucket.terraform_state.arn
}
