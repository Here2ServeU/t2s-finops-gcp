resource "google_monitoring_alert_policy" "cost_alert" {
  display_name = "FinOps Cost Alert"
  combiner     = "OR"
  conditions {
    display_name = "Cost Exceeds Threshold"
    condition_threshold {
      filter          = "metric.type=\"billing.googleapis.com/billing/cost\""
      threshold_value = var.threshold_value
      duration        = "60s"
      comparison      = "COMPARISON_GT"
    }
  }
}
