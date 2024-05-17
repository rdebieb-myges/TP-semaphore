resource "google_compute_instance_group" "Semaphore" {
  name        = "tp-semaphore"
  description = "Terraform TP Semaphore group"
  project = google_project.my_project.project_id

  instances = [
    google_compute_instance.Semaphore.id,
  ]

  named_port {
    name = "http"
    port = "80"
  }

  zone = "europe-west1-c"
}