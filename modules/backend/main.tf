resource "google_storage_bucket" "terraform_state" {
  name          = var.bucket_name
  location      = var.location
  storage_class = "STANDARD"
  versioning {
    enabled = true
  }
}
