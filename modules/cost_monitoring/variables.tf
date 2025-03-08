variable "project_id" {
  description = "Google Cloud Project ID"
  type        = string
}

variable "threshold_value" {
  description = "Cost threshold for alerts"
  type        = number
  default     = 400
}
