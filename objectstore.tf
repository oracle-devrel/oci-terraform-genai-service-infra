resource "oci_objectstorage_bucket" "object_storage_bucket" {
  count = local.count_objectstorage
  access_type    = var.bucket_access_type
  auto_tiering   = var.auto_tiering
  compartment_id = var.compartment_id

  metadata = {
  }
  namespace             = data.oci_objectstorage_namespace.NAMESPACE.namespace
  name                  = "${var.name_prefix}_bucket_for_tuning"
  object_events_enabled = var.object_events_enabled
  storage_tier          = var.storage_tier
  versioning            = var.versioning
}

#resource "null_resource" "update_file_to_objectstore" {
#  count = local.count_objectstorage
#  depends_on = [var.create_new_objectstorage_bucket]
#  provisioner "local-exec" {
#    command = <<-EOT
#    oci os object put -bn ${oci_objectstorage_bucket.object_storage_bucket[0].name} --file "${path.module}/sample-data/${var.model_fine_tune_details_training_dataset_object}"
#    EOT
#  }
#
#}

locals {
  count_objectstorage = var.create_a_custom_model && var.create_new_objectstorage_bucket ? 1 : 0
}