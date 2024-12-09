server:
  fullnameOverride: ${fullnameoverride}
  scrape:
    enabled: ${scrape_enabled}
  resources:
    limits:
      cpu: ${limits_cpu}
      memory: ${limits_memory}
    requests:
      cpu: ${request_cpu}
      memory: ${request_memory}