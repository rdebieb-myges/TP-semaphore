resource "google_compute_instance" "Semaphore" {
  name         = "my-instance"
  project = google_project.my_project.project_id
  machine_type = "e2-micro"
  zone         = "europe-west1-c"
  allow_stopping_for_update = true
  tags         = ["demo-vm-instance"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
      labels = {
        my_label = "value"
      }
    }
  }

  network_interface {
      subnetwork = google_compute_subnetwork.test_subnet.self_link

    access_config {
      nat_ip = google_compute_address.static1.address
    }
  }

  metadata = {
    foo = "bar"
    ssh-keys = "ryandebieb7820:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDy/yyyoq3xc7MboJDyAeKhVMiQrjQ27eRvoFBMnpNIusu+813svPDZuT6DMl222AZ7TxII8NUIkDvrJ5xbgg8pSHZvuWzfeAzZtM7dPT4YKCauAPjbnq5n0TH4xHwmG1ooxGCFuDkdS4bJUla9Yb0+gWvcjy9YiGhIE6SYdIX2oGTFXk2j0Da1dxI2LzrY1LUjUkQGpmsNgOKZfCqRiHJUtG57IYZVZ2YjnVNmSdVldfwBucOnrp6yUUbkWv3Zat2qMnfuOOi0AcrJL0aJKyh/X14NEUGeoYXaEFbR3Z+zoe3GtVsCvOxZuRlpUHZFJkh8vBQ+RxhMUVUzhGRBiyqr"
  }

  metadata_startup_script = "sudo apt update && sudo apt install -y nginx"

  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    email  = google_service_account.default.email
    scopes = ["cloud-platform"]
  }
    depends_on = [ google_project_service.project ]
}