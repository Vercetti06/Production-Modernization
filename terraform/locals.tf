locals {
  name_prefix = "ecostream-${var.env}"

  common_tags = {
    Project     = "EcoStream"
    Environment = var.env
    ManagedBy   = "Terraform"
  }
}
