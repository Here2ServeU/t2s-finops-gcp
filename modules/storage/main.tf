resource "google_storage_bucket" "finops_reports" {
  name          = var.bucket_name
  location      = "US"
  storage_class = "STANDARD"
  versioning {
    enabled = true
  }
}
