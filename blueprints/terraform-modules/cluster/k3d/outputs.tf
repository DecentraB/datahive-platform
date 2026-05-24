output "cluster_name" {
  value       = local.cluster_name
  description = "The name of the created cluster"
}

output "cluster_endpoint" {
  value       = data.external.cluster_info.result.server
  description = "The API server endpoint of the created cluster"
}

output "cluster_certificate_authority_data" {
  value       = data.external.cluster_info.result.certificate-authority-data
  description = "The base64-encoded certificate authority data for the cluster"
}
