variable "k3s_version" {
  description = "The K3s version/image tag to use"
  type        = string
  default     = "v1.31.5-k3s1"
}

variable "cluster_name" {
  description = "Name of the cluster to be created"
  type        = string
  default     = "datahive"
}

variable "server_count" {
  description = "Number of control-plane nodes"
  type        = number
  default     = 1
}

variable "agent_count" {
  description = "Number of worker nodes"
  type        = number
  default     = 2
}
