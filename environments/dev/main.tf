module "budget" {
  source           = "../../modules/budget"
  billing_account = var.billing_account
  project_id      = var.project_id
}

module "cost_monitoring" {
  source      = "../../modules/cost_monitoring"
  project_id  = var.project_id
}

module "cloud_functions_optimizer" {
  source      = "../../modules/cloud_functions_optimizer"
  project_id  = var.project_id
}

module "storage" {
  source      = "../../modules/storage"
  project_id  = var.project_id
  bucket_name = var.storage_bucket
}

module "security" {
  source      = "../../modules/security"
  project_id  = var.project_id
}
