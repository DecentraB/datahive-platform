output "namespace" {
  description = "Kubernetes namespace where Vault is installed"
  value       = helm_release.vault.namespace
}

output "release_name" {
  description = "Helm release name for Vault"
  value       = helm_release.vault.name
}

output "chart_version" {
  description = "Installed Vault Helm chart version"
  value       = helm_release.vault.version
}
