resource "google_security_center_organization_settings" "t2s_security" {
  organization_id       = var.project_id
  enable_asset_discovery = true
}
