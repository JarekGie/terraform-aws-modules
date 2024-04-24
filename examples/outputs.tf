output "id" {
  description = "The id of the bucket"
  value       = module.remote_state.bucket_id
}
output "bucket_arn" {
  description = "The arn of the bucket"
  value       = module.remote_state.bucket_arn
}
