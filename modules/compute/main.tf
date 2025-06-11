resource "google_compute_instance_template" "default" {
  name         = var.instance_name
  machine_type = var.machine_type
  region       = var.region

  disk {
    source_image = var.image
    auto_delete  = true
    boot         = true
  }

  network_interface {
    network    = var.vpc_id
    subnetwork = var.subnetwork_id
    access_config {
      // Ephemeral IP
    }
  }

  metadata = var.tags
}

resource "google_compute_instance_group_manager" "default" {
  name               = "${var.instance_name}-igm"
  version            = {
    instance_template = google_compute_instance_template.default.id
  }
  base_instance_name = var.instance_name
  zone               = var.zone
  target_size        = var.min_replicas
}

resource "google_compute_autoscaler" "default" {
  name   = "${var.instance_name}-autoscaler"
  zone   = var.zone
  target = google_compute_instance_group_manager.default.id

  autoscaling_policy {
    min_replicas = var.min_replicas
    max_replicas = var.max_replicas

    cpu_utilization {
      target = var.cpu_target
    }
  }
}

resource "google_compute_health_check" "http" {
  name               = "${var.instance_name}-health-check"
  check_interval_sec = 10
  timeout_sec        = 5

  http_health_check {
    request_path = "/"
    port         = 80
  }
}

resource "google_compute_backend_service" "default" {
  name                  = "${var.instance_name}-backend-service"
  health_checks         = [google_compute_health_check.http.id]
  load_balancing_scheme = "EXTERNAL"

  backend {
    group = google_compute_instance_group_manager.default.instance_group
  }
}

resource "google_compute_url_map" "default" {
  name            = "${var.instance_name}-url-map"
  default_service = google_compute_backend_service.default.id
}

resource "google_compute_target_http_proxy" "default" {
  name   = "${var.instance_name}-http-proxy"
  url_map = google_compute_url_map.default.id
}

resource "google_compute_global_forwarding_rule" "default" {
  name       = "${var.instance_name}-forwarding-rule"
  target     = google_compute_target_http_proxy.default.id
  port_range = "80"
  ip_protocol = "TCP"
}