# Export des adresses IP et noms d'instance
output "instance_ip" {
  description = "Adresse IP publique de l'instance"
  value       = google_compute_instance.default.network_interface[0].access_config[0].nat_ip
}

output "instance_name" {
  description = "Nom de l'instance créée"
  value       = google_compute_instance.default.name
}
