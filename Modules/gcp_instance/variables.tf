# Variables pour la configuration de l'instance
variable "project_id" {
  description = "ID du projet GCP"
  type        = string
}

variable "region" {
  description = "Région pour l'instance GCP"
  type        = string
}

variable "zone" {
  description = "Zone pour l'instance GCP"
  type        = string
}

variable "instance_name" {
  description = "Nom de l'instance"
  type        = string
}

variable "machine_type" {
  description = "Type de machine (ex: e2-medium)"
  type        = string
}

variable "disk_image" {
  description = "Image du disque (ex: debian-cloud/debian-10)"
  type        = string
}

variable "disk_size" {
  description = "Taille du disque en GB"
  type        = number
  default     = 10
}

variable "network" {
  description = "Réseau pour l'instance"
  type        = string
}

variable "subnetwork" {
  description = "Sous-réseau pour l'instance"
  type        = string
}

variable "instance_tags" {
  description = "Tags pour l'instance"
  type        = list(string)
  default     = []
}

variable "service_account_email" {
  description = "Adresse email du compte de service"
  type        = string
}

variable "scopes" {
  description = "Scopes d'accès pour le compte de service"
  type        = list(string)
  default     = ["https://www.googleapis.com/auth/cloud-platform"]
}

variable "preemptible" {
  description = "Indique si l'instance est préemptible"
  type        = bool
  default     = false
}

variable "automatic_restart" {
  description = "Redémarrage automatique de l'instance"
  type        = bool
  default     = true
}

variable "enable_secure_boot" {
  description = "Activer le démarrage sécurisé (Secure Boot)"
  type        = bool
  default     = false
}

variable "enable_vtpm" {
  description = "Activer vTPM"
  type        = bool
  default     = true
}

variable "enable_integrity_monitoring" {
  description = "Activer le monitoring de l'intégrité"
  type        = bool
  default     = true
}

variable "firewall_protocol" {
  description = "Protocole du firewall (tcp, udp, etc.)"
  type        = string
  default     = "tcp"
}

variable "firewall_ports" {
  description = "Ports autorisés par le firewall"
  type        = list(string)
  default     = ["22"]
}

variable "firewall_source_ranges" {
  description = "Plages d'IP sources autorisées"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "additional_disks" {
  description = "Disques supplémentaires à attacher"
  type        = list(string)
  default     = []
}
