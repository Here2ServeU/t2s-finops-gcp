resource "google_cloudfunctions_function" "auto_optimizer" {
  name        = "finops-auto-optimizer"
  runtime     = "python310"
  entry_point = "main"

  event_trigger {
    event_type = "google.pubsub.topic.publish"
    resource   = "projects/${var.project_id}/topics/finops-auto-optimizer"
  }
}
