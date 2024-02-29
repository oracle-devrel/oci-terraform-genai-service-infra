#Dedicated cluster for hosting
resource "oci_generative_ai_dedicated_ai_cluster" "dedicated_ai_cluster_for_hosting" {
  #Required
  count          = var.create_dac_for_hosting ? 1 : 0
  compartment_id = var.compartment_id
  type           = "HOSTING"
  unit_count     = var.dedicated_ai_cluster_unit_count_for_hosting
  unit_shape     = var.dedicated_ai_cluster_unit_shape_for_hosting
  #Optional
  description   = "${var.name_prefix} Cluster for Hosting model ${var.dedicated_ai_cluster_unit_shape_for_hosting}"
  display_name  = "${var.name_prefix}_cluster_for_hosting"
  defined_tags  = var.defined_tags
  freeform_tags = var.freeform_tags
}

#Dedicated cluster for Tuning
resource "oci_generative_ai_dedicated_ai_cluster" "dedicated_ai_cluster_for_tuning" {
  #Required
  count          = var.create_dac_for_tuning ? 1 : 0
  compartment_id = var.compartment_id
  type           = "FINE_TUNING"
  unit_count     = var.dedicated_ai_cluster_unit_count_for_tuning
  unit_shape     = var.dedicated_ai_cluster_unit_shape_for_tuning
  #Optional
  description   = "${var.name_prefix} Cluster for Tuning model ${var.dedicated_ai_cluster_unit_shape_for_hosting}"
  display_name  = "${var.name_prefix}_cluster_for_tuning"
  defined_tags  = var.defined_tags
  freeform_tags = var.freeform_tags
  lifecycle {
    ignore_changes = [

    ]
  }
}