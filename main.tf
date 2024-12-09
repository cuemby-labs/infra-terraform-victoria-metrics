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

  values = [
    templatefile("${path.module}/values.yaml.tpl", {
      scrape_enabled   = var.scrape_enabled,
      fullnameoverride = var.fullnameoverride,
      request_memory   = var.resources["requests"]["memory"],
      limits_memory    = var.resources["limits"]["memory"],
      request_cpu      = var.resources["requests"]["cpu"],
      limits_cpu       = var.resources["limits"]["cpu"]
    }),
    yamlencode(var.values)
  ]
}

#
# Walrus Information
#

locals {
  context = var.context
}

module "submodule" {
  source = "./modules/submodule"

  message = "Hello, submodule"
}