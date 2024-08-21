# Template pour les règles de firewall

resource "google_compute_firewall" "custom_firewall" {
  name    = "${var.instance_name}-custom-firewall"
  network = var.network

  allow {
    protocol = var.firewall_protocol
    ports    = var.firewall_ports
  }

  source_ranges = var.firewall_source_ranges
}
