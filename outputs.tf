output "name_of_dac_for_hosting" {
  value = try(var.create_dac_for_hosting ? oci_generative_ai_dedicated_ai_cluster.dedicated_ai_cluster_for_hosting[0].display_name : "Not Applicable", "NA")
}

output "name_of_dac_for_finetuning" {
  value = try(var.create_dac_for_tuning ? oci_generative_ai_dedicated_ai_cluster.dedicated_ai_cluster_for_tuning[0].display_name : " Not Applicable", "NA")
}

output "endpoint_ocid" {
  value = try(var.create_custom_endpoint ? oci_generative_ai_endpoint.endpoint[0].id : "Not Applicable", "NA")
}