variable "namespace" {
  description = "Kubernetes namespace where Vault will be installed"
  type        = string
  default     = "vault"
}

variable "release_name" {
  description = "Helm release name for Vault"
  type        = string
  default     = "vault"
}

variable "chart_version" {
  description = "Version of the Vault Helm chart to install"
  type        = string
  default     = "0.32.0"
}

variable "timeout" {
  description = "Timeout, in seconds, for Helm operations"
  type        = number
  default     = 1800
}

variable "extra_values" {
  description = "Additional values to merge into the Vault Helm chart values. Do not pass secrets here."
  type        = any
  default     = {}
}
