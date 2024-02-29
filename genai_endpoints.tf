resource "oci_generative_ai_endpoint" "endpoint" {
  count = var.create_custom_endpoint ? 1 : 0
  #Required
  compartment_id = var.compartment_id
  dedicated_ai_cluster_id = oci_generative_ai_dedicated_ai_cluster.dedicated_ai_cluster_for_hosting[0].id
  model_id = oci_generative_ai_model.custom_model[0].id

  #Optional
  content_moderation_config {
    #Required
    is_enabled = var.endpoint_content_moderation_config_is_enabled
  }
  defined_tags = var.defined_tags
  description = var.endpoint_description
  display_name = "${var.name_prefix}_custom_endpoint"
  freeform_tags = var.freeform_tags
  lifecycle {
    replace_triggered_by = [
      oci_generative_ai_dedicated_ai_cluster.dedicated_ai_cluster_for_tuning
    ]
  }
}