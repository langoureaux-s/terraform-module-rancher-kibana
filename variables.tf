variable "project_name" {
    description = "The project name (environment name)"
}
variable "stack_name" {
    description = "The name for the Elasticsearch stack"
}
variable "finish_upgrade" {
  description = "Automatically finish upgrade on Rancher when apply new plan"
}


variable "image_version" {
  description = "The image version of Kibana to use"
  default = "6.5.4-1"
}
variable "kibana_password" {
  description = "The kibana password"
}
variable "encryption_key" {
  description = "The encryption key needed when multiple kibana instance"
}
variable "monitoring_ui" {
  description = "Permit to enable/disable the monitoring"
}
variable "scale" {
  description = "Set the number of instance you should.Don't use it if you should global_scheduling as true"
  default = ""
}
variable "label_scheduling" {
  description = "The label to use when schedule this stack"
  default = ""
}
variable "global_scheduling" {
  description = "Set to true if you should to deploy on all node that match label_scheduling"
  default     = "true"
}


variable "client_stack" {
  description = "The Elasticsearch stack name"
}

variable "container_memory" {
  description = "The maximum of memory that Elasticsearch container can consume"
}
variable "cpu_shares" {
  description = "The maximum of CPU usage that Elasticsearch container can consume"
  default = "1024"
}





