resource "google_project_service" "cloud-resource-manager-api" {
    disable_on_destroy = false
    project            = var.google-project.project-id
    service            = "cloudresourcemanager.googleapis.com"
}

resource "google_project_service" "compute-engine-api" {
    disable_on_destroy = false
    project            = var.google-project.project-id
    service            = "compute.googleapis.com"
}
