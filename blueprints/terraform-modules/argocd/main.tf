terraform {
  required_version = ">= 1.4.0"

  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.30.0"
    }

    helm = {
      source  = "hashicorp/helm"
      version = "3.1.1"
    }
  }
}

resource "helm_release" "argocd" {
  name          = var.release_name
  repository    = "https://argoproj.github.io/argo-helm"
  chart         = "argo-cd"
  version       = var.chart_version
  namespace     = var.namespace
  timeout       = var.timeout
  wait_for_jobs = true

  create_namespace = true

  values = [
    yamlencode(var.extra_values),
  ]
}
