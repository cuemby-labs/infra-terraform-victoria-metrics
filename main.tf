#
# Victoria Metrics Resources
#

resource "helm_release" "ingress_nginx" {
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