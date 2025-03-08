terraform {
  backend "gcs" {
    bucket  = "t2s-finops-terraform-state"
    prefix  = "state/finops.tfstate"
  }
}
