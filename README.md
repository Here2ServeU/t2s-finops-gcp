# T2S FinOps Infrastructure on Google Cloud (GCP) with Terraform

This repository provisions a FinOps infrastructure on **Google Cloud Platform (GCP)** using **Terraform modules and environments (dev, stage, prod)**.

It includes **budget monitoring, cost anomaly detection, automatic cost optimization, security logging, and storage**.

---

## Features
- **Google Cloud Budgets & Alerts** for cost monitoring.
- **Cloud Billing Reports** to track and control spending.
- **Cloud Monitoring & Logging** for real-time insights.
- **Security Command Center** for security monitoring.
- **Google Cloud Storage** for storing FinOps cost reports.
- **Cloud Functions Auto-Optimizer** to stop underutilized resources.
- **Terraform modules & environments** for scalable infrastructure.

---

## Project Structure
```plaintext
T2S-FINOPS-GCP/
├── environments/
│   ├── dev/
│   │   ├── backend.tf
│   │   ├── main.tf
│   │   ├── provider.tf
│   │   ├── terraform.tfvars
│   │   ├── variables.tf
│   │   ├── versions.tf
│   ├── prod/
│   ├── stage/
├── modules/
│   ├── backend/
│   ├── budget/
│   ├── cost_monitoring/
│   ├── cloud_functions_optimizer/
│   ├── storage/
│   ├── security/
└── README.md
```

---

## Prerequisites

Before deploying, ensure you have:
	•	Terraform installed (>= 1.5.0)
	•	Google Cloud SDK installed & authenticated (gcloud auth application-default login)
	•	A Google Cloud project with billing enabled
	•	A GCS bucket for Terraform state storage

Step 1: Backend (State Management)
	•	Navigate to /modules/backend/ and configure the Terraform backend:

bucket         = "t2s-finops-terraform-state"
prefix         = "state/finops.tfstate"

	•	Run:

terraform init
terraform validate
terraform apply -auto-approve

Step 2: Configure Variables

Modify terraform.tfvars in environments/dev/:

gcp_region         = "us-central1"
billing_account_id = "123456-789ABC-DEF012"
project_id         = "t2s-finops"
storage_bucket     = "t2s-finops-reports"

Modify backend.tf:

terraform {
  backend "gcs" {
    bucket  = "t2s-finops-terraform-state"
    prefix  = "state/finops.tfstate"
  }
}

Step 3: Deploy the Infrastructure

cd environments/dev
terraform init
terraform plan -var-file="terraform.tfvars"
terraform apply -var-file="terraform.tfvars" -auto-approve

Step 4: Verify Resources

gcloud billing budgets list --billing-account=123456-789ABC-DEF012
gcloud logging logs list
gcloud functions list | grep finops-auto-optimizer

Step 5: Deploy to Other Environments

cd environments/stage
terraform apply -var-file="terraform.tfvars" -auto-approve

cd environments/prod
terraform apply -var-file="terraform.tfvars" -auto-approve

Step 6: Destroy the Infrastructure

terraform destroy -var-file="terraform.tfvars" -auto-approve
gcloud storage rm --recursive gs://t2s-finops-terraform-state

Key Takeaways
	•	Terraform for GCP FinOps scalability
	•	Cost monitoring with Cloud Budgets
	•	Cloud Functions for auto-optimization
	•	Security Command Center for monitoring
	•	GCS for storing cost reports



