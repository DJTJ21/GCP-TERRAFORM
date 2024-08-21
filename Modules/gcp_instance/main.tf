# Configuration du fournisseur GCP
provider "google" {
  project = var.project_id
  region  = var.region
  zone    = var.zone
}

# Création d'une instance Compute Engine
resource "google_compute_instance" "default" {
  name         = var.instance_name
  machine_type = var.machine_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = var.disk_image
      size  = var.disk_size
    }
  }

  network_interface {
    network       = var.network
    subnetwork    = var.subnetwork
    access_config {
      # Pour une IP publique
    }
  }

  metadata = {
    startup-script = templatefile("${path.module}/templates/startup_script.sh.tpl", {
      instance_name = var.instance_name
      project_id    = var.project_id
    })
  }

  tags = var.instance_tags

  service_account {
    email  = var.service_account_email
    scopes = var.scopes
  }

  scheduling {
    preemptible       = var.preemptible
    automatic_restart = var.automatic_restart
  }

  shielded_instance_config {
    enable_secure_boot          = var.enable_secure_boot
    enable_vtpm                 = var.enable_vtpm
    enable_integrity_monitoring = var.enable_integrity_monitoring
  }

  # Attache les règles de firewall (si nécessaires)
  dynamic "attached_disk" {
    for_each = var.additional_disks
    content {
      source = attached_disk.value
    }
  }
}

# Règles de firewall pour l'instance
resource "google_compute_firewall" "default" {
  name    = "${var.instance_name}-firewall"
  network = var.network

  allow {
    protocol = var.firewall_protocol
    ports    = var.firewall_ports
  }

  source_ranges = var.firewall_source_ranges
}

# Export des adresses IP et noms d'instance
output "instance_ip" {
  value = google_compute_instance.default.network_interface[0].access_config[0].nat_ip
}

output "instance_name" {
  value = google_compute_instance.default.name
}
