variable "billing_account" {
  description = "The billing account ID"
  type        = string
}

variable "budget_limit" {
  description = "The monthly budget limit in USD"
  type        = number
  default     = 500
}
