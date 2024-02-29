resource "oci_generative_ai_model" "custom_model" {
  count = var.create_a_custom_model ? 1 : 0
  #Required
  base_model_id  = data.oci_generative_ai_models.list_models.model_collection[0].items[0].id
  compartment_id = var.compartment_id
  fine_tune_details {
    #Required
    dedicated_ai_cluster_id = oci_generative_ai_dedicated_ai_cluster.dedicated_ai_cluster_for_tuning[0].id
    training_dataset {
      #Required
      bucket       = oci_objectstorage_bucket.object_storage_bucket[0].name
      dataset_type = var.model_fine_tune_details_training_dataset_dataset_type
      namespace    = oci_objectstorage_bucket.object_storage_bucket[0].namespace
      object       = var.model_fine_tune_details_training_dataset_object
    }

    #Optional
    training_config {
      #Required
      training_config_type = var.model_fine_tune_details_training_config_training_config_type
    }
  }
  #Optional
  defined_tags  = var.defined_tags
  description   = var.model_description
  display_name  = "${var.name_prefix}CustomModel"
  freeform_tags = var.freeform_tags
  lifecycle {
    replace_triggered_by = [
      oci_generative_ai_dedicated_ai_cluster.dedicated_ai_cluster_for_tuning
    ]
  }

}