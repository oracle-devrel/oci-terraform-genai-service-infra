data "oci_objectstorage_namespace" "NAMESPACE" {
  compartment_id = var.compartment_id
}

data "oci_generative_ai_models" "list_models" {
  compartment_id = var.compartment_id
  filter {
    name   = "vendor"
    values = var.model_vendor
  }
  filter {
    name   = "state"
    values = var.model_state
  }
  filter {
    name   = "capabilities"
    values = var.model_capabilities
  }
  filter {
    name   = "display_name"
    values = [local.name]
  }

  filter {
    name   = "version"
    values = var.model_version
  }
}


locals {
  name = var.dedicated_ai_cluster_unit_shape_for_tuning == "SMALL_COHERE" ? "cohere.command-light" : "cohere.command"
}