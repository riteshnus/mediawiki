locals {
  akv_access_policies = {}
  tags = {
    Project     = lower(join("", var.project_name))
    Environment = lower(join("", var.environment))
    Region      = lower(join("", var.region_mapping))
  }
}
