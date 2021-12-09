resource "google_service_account" "service_account" {
  account_id = var.service_account_name
}

resource "google_project_iam_member" "project_iam_member" {
  member  = "serviceAccount:${google_service_account.service_account.account_id}@${var.project_id}.iam.gserviceaccount.com"
  role    = "roles/dns.admin"
  project = var.project_id
}

# resource "google_service_account_iam_binding" "admin-account-iam" {
#   service_account_id = google_service_account.service_account.name
#   role               = "roles/iam.workloadIdentityUser"

#   members = [
#     "serviceAccount:${var.project_id}.svc.id.goog[cert-manager/cert-manager]",
#   ]
# }
