resource "google_billing_budget" "finops_budget" {
  billing_account = var.billing_account
  display_name    = "T2S FinOps Budget"
  amount {
    specified_amount {
      currency_code = "USD"
      units         = var.budget_limit
    }
  }
  threshold_rules {
    threshold_percent = 0.5
    spend_basis       = "CURRENT_SPEND"
  }
  threshold_rules {
    threshold_percent = 0.9
    spend_basis       = "CURRENT_SPEND"
  }
}
