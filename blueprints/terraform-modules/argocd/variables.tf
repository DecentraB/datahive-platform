variable "namespace" {
  description = "Kubernetes namespace where Argo CD will be installed"
  type        = string
  default     = "argocd"
}

variable "release_name" {
  description = "Helm release name for Argo CD"
  type        = string
  default     = "argocd"
}

variable "chart_version" {
  description = "Version of the argo-cd Helm chart to install"
  type        = string
  default     = "9.5.13"
}

variable "timeout" {
  description = "Timeout, in seconds, for Helm operations"
  type        = number
  default     = 1800
}

variable "extra_values" {
  description = "Additional values to merge into the Argo CD Helm chart values. Do not pass secrets here."
  type        = any
  default     = {}
}
