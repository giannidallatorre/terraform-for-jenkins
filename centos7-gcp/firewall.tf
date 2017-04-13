resource "google_compute_firewall" "allow-http" {
  name    = "${var.name}-allow-http"
  network = "${var.name}-net"

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  target_tags   = ["http-server"]
  source_ranges = ["0.0.0.0/0"]
  depends_on    = ["google_compute_network.net"]
}

resource "google_compute_firewall" "allow-https" {
  name    = "${var.name}-allow-https"
  network = "${var.name}-net"

  allow {
    protocol = "tcp"
    ports    = ["443"]
  }

  target_tags   = ["https-server"]
  source_ranges = ["0.0.0.0/0"]
  depends_on    = ["google_compute_network.net"]
}

resource "google_compute_firewall" "allow-icmp" {
  name    = "${var.name}-allow-icmp"
  network = "${var.name}-net"

  allow {
    protocol = "icmp"
  }

  source_ranges = ["0.0.0.0/0"]
  depends_on    = ["google_compute_network.net"]
}

resource "google_compute_firewall" "allow-ssh" {
  name    = "${var.name}-allow-ssh"
  network = "${var.name}-net"

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
  depends_on    = ["google_compute_network.net"]
}
