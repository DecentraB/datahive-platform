locals {
  cluster_name = terraform_data.k3d_cluster.output.cluster_name

  # Default kubeconfig path for k3d clusters
  kubeconfig_path = pathexpand("~/.config/k3d/kubeconfig-${local.cluster_name}.yaml")
}

resource "terraform_data" "k3d_cluster" {
  # Triggers a full replacement if core infrastructure parameters change
  triggers_replace = {
    agent_count  = var.agent_count
    server_count = var.server_count
    k3s_version  = var.k3s_version
  }

  # Provisioning phase: Cluster creation
  provisioner "local-exec" {
    command = <<EOT
            k3d cluster create ${var.cluster_name} \
                --agents ${var.agent_count} \
                --servers ${var.server_count} \
                --image rancher/k3s:${var.k3s_version}
        EOT
  }

  # Destruction phase: Clean up the cluster from the local machine
  provisioner "local-exec" {
    when    = destroy
    command = "k3d cluster delete ${self.output.cluster_name}"
  }

  # Export output for downstream resource consumption
  input = {
    cluster_name = var.cluster_name
  }
}

data "external" "cluster_info" {
  depends_on = [terraform_data.k3d_cluster]

  program = ["sh", "-c", <<EOT
            k3d kubeconfig get ${local.cluster_name} | yq -o json . | jq -r '.clusters[0].cluster'
        EOT
  ]
}
