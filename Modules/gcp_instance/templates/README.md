

# Terraform Module for Creating a GCP Instance

## Description

This Terraform module creates a Google Compute Engine instance in GCP. It is designed to be reusable with configurable parameters. Possible configurations include machine type, disk image, networks, firewall rules, and more.

## Usage

```hcl
module "gcp_instance" {
  source                = "./gcp_instance"
  project_id            = "your-project-id"
  region                = "us-central1"
  zone                  = "us-central1-a"
  instance_name         = "my-instance"
  machine_type          = "e2-medium"
  disk_image            = "debian-cloud/debian-10"
  disk_size             = 20
  network               = "default"
  subnetwork            = "default"
  service_account_email = "your-service-account@your-project.iam.gserviceaccount.com"
}
```

## Variables

The complete list of variables can be found in the `variables.tf` file.

## Outputs

- `instance_ip`: Public IP address of the instance.
- `instance_name`: Name of the instance.

## License

This module is licensed under the MIT License. See the LICENSE file for details.

