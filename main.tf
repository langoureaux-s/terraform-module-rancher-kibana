terraform {
  # The configuration for this backend will be filled in by Terragrunt
  backend "consul" {}
}

# Template provider
provider "template" {
  version = "~> 1.0"
}

# Get the project data
data "rancher_environment" "project" {
  name = "${var.project_name}"
}




data "template_file" "docker_compose_kibana" {
  template = "${file("${path.module}/rancher/kibana/docker-compose.yml")}"

  vars {
    kibana_password         = "${var.kibana_password}"
    monitoring_ui           = "${var.monitoring_ui}"
    label_scheduling        = "${var.label_scheduling}"
    global_scheduling       = "${var.global_scheduling}"
    kb_version              = "${var.image_version}"
    container_memory        = "${var.container_memory}"
    cpu_shares              = "${var.cpu_shares}"
    encryption_key          = "${var.encryption_key}"
    client_stack            = "${var.client_stack}"
  }
}
data "template_file" "rancher_compose_kibana" {
  template = "${file("${path.module}/rancher/kibana/rancher-compose.yml")}"

  vars {
    scale = "${var.scale}"
  }
}
resource "rancher_stack" "this" {
  name            = "${var.stack_name}"
  description     = "Kibana - Dashboard"
  environment_id  = "${data.rancher_environment.project.id}"
  scope           = "user"
  start_on_create = true
  finish_upgrade  = "${var.finish_upgrade}"
  docker_compose  = "${data.template_file.docker_compose_kibana.rendered}"
  rancher_compose = "${data.template_file.rancher_compose_kibana.rendered}"
}