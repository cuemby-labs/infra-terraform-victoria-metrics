#
# Victoria Metrics Resources
#
resource "kubernetes_namespace" "victoria_metrics" {
  metadata {
    name = var.namespace_name
  }
}

resource "helm_release" "victoria_metrics" {
  name       = var.helm_release_name
  namespace  = var.namespace_name
  repository = "https://victoriametrics.github.io/helm-charts/"
  chart      = "victoria-metrics-single"
  version    = var.helm_chart_version
  values     = [file("${path.module}/values.yaml")]
}

#
# Walrus Information
#

locals {
  context = var.context
}