#
# Victoria Metrics Variables
#

variable "helm_release_name" {
  description = "The name of the Helm release."
  type        = string
  default     = "victoria-metrics-single"
}

variable "namespace_name" {
  description = "The namespace where the Helm release will be installed."
  type        = string
  default     = "victoria-system"
}

variable "fullnameoverride" {
  description = "Overrides the full name of server component."
  type        = string
  default     = "victoria-metrics"
}

variable "helm_chart_version" {
  description = "The version for the Helm chart."
  type        = string
  default     = "0.13.0"
}

variable "scrape_enabled" {
  description = "Enable scrape configuration"
  type        = bool
  default     = false
}

variable "values" {
  description = "Chart values"
  type        = any
  default     = {}
}

variable "resources" {
  description = "Resource limits and requests for the Helm release."
  type        = map(map(string))

  default = {
    limits = {
      cpu    = "500m"
      memory = "512Mi"
    }
    requests = {
      cpu    = "250m"
      memory = "256Mi"
    }
  }
}

#
# Contextual Fields
#

variable "context" {
  description = <<-EOF
Receive contextual information. When Walrus deploys, Walrus will inject specific contextual information into this field.

Examples:
```
context:
  project:
    name: string
    id: string
  environment:
    name: string
    id: string
  resource:
    name: string
    id: string
```
EOF
  type        = map(any)
  default     = {}
}