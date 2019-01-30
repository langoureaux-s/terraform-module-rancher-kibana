# terraform-module-rancher-kibana

This module permit to deploy Kibana stack on Rancher 1.6.x.

```
terragrunt = {
  terraform {
    source = "git::https://github.com/langoureaux-s/terraform-module-rancher-kibana.git"
  }
  
  project_name            = "test"
  stack_name              = "kibana"
  finish_upgrade          = "true"
  label_global_scheduling = "kibana=true"
  kibana_password         = "y1546n02h482I1u2"
  encryption_key          = "y1546n02h482I1u10"
  monitoring_ui           = "false"
  scale                   = "2"
  client_stack            = "elasticsearch/elasticsearch"
  container_memory        = "1g"
}
```

> Don't forget to read the file `variables.tf` to get all informations about variables.