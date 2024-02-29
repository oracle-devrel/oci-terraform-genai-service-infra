
## Copyright © 2022, Oracle and/or its affiliates.
## All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl
/*Common Variables*/
variable "tenancy_ocid" {}
# variable "user_ocid" {}
# variable "private_key_path" {}
# variable "fingerprint" {}
variable "compartment_id" {}
variable "region" {}
variable "name_prefix" {
  default = "OCIGenAIService"
  description = "A prefix for resources names"
}

variable "release" {
  description = "Reference Architecture Release (OCI Architecture Center)"
  default     = "0.0.0"
}

/*Tag variable*/
variable "defined_tags" {
  default = {}
  description = "OCI Defined tags"
}
variable "freeform_tags" {
  default = {}
  description = "OCI Freeform tags"
}


/*Dedicated AI Cluster (DAC) variables for hosting*/
 variable "create_dac_for_hosting" {
   default = true
   description = "Set false to not to create a DAC for hosting"
 }



variable "dedicated_ai_cluster_unit_count_for_hosting" {
  default = 1
  description = "number of dedicated units in AI cluster for hosting"
}
variable "dedicated_ai_cluster_unit_shape_for_hosting" {
  default = "LARGE_COHERE"
  description = "The shape of dedicated unit in this AI cluster"
}

/*Dedicated AI Cluster(DAC) variables for Tuning*/

variable "create_dac_for_tuning" {
  default = true
  description = "set false to not to create a DAC for fine tuning"
}
variable "dedicated_ai_cluster_unit_count_for_tuning" {
  default = 2
  description = "number of dedicated units in AI cluster for tuning"
}
variable "dedicated_ai_cluster_unit_shape_for_tuning" {
  default = "SMALL_COHERE"
  description = "The shape of dedicated unit in this AI cluster"
}

/*Object Storage bucket Variables for Tuning*/

variable "create_new_objectstorage_bucket" {
  default = true
  description = "Set to false to use an existing object storage bucket"
}

variable "existing_objectstorage_bucket_ocid" {
  default = ""
  description = "OCID of the existing objectstorage bucket"
}
variable "bucket_access_type" {
  description = "(Optional) (Updatable) The type of public access enabled on this bucket. A bucket is set to NoPublicAccess by default, which only allows an authenticated caller to access the bucket and its contents. When ObjectRead is enabled on the bucket, public access is allowed for the GetObject, HeadObject, and ListObjects operations. When ObjectReadWithoutList is enabled on the bucket, public access is allowed for the GetObject and HeadObject operations."
  default     = "NoPublicAccess"
}
variable "auto_tiering" {
  description = "Determines if autotiering is enabled for object"
  default     = "Disabled"
}

variable "object_events_enabled" {
  description = "Whether or not events are emitted for object state changes in this bucket. By default, objectEventsEnabled is set to false. Set objectEventsEnabled to true to emit events for object state changes. For more information about events, see Overview of Events."
  type        = bool
  default     = false
}

variable "storage_tier" {
  description = "The storage tier type assigned to the bucket. A bucket is set to 'Standard' tier by default, which means objects uploaded or copied to the bucket will be in the standard storage tier. When the 'Archive' tier type is set explicitly for a bucket, objects uploaded or copied to the bucket will be stored in archive storage. The 'storageTier' property is immutable after bucket is created."
  default     = "Standard"
}

variable "versioning" {
  description = "The versioning status on the bucket. A bucket is created with versioning Disabled by default. For versioning Enabled, objects are protected from overwrites and deletes, by maintaining their version history. When versioning is Suspended, the previous versions will still remain but new versions will no longer be created when overwitten or deleted."
  default     = "Enabled"
}
/* Variables for custom model*/

variable "model_state" {
  default = ["ACTIVE"]
  description = "State of a model to fetch"
}
variable "model_vendor" {
  default = ["cohere"]
  description = "vendor for the model"
}
variable "model_version" {
  default = ["15.6"]
  description = "Version to finetune"
}

variable "model_capabilities" {
  default = ["FINE_TUNE"]
  description = "model capabilities"
}

variable "create_a_custom_model" {
  default = true
  description = "Set false to not to create a custom model"
}
variable "model_fine_tune_details_training_dataset_dataset_type" {
  default = "OBJECT_STORAGE"
  description = "type of dataset store"
}
variable "model_fine_tune_details_training_dataset_object" {
  default = "sample.jsonl"
  description = "Default sample file"
}
variable "model_fine_tune_details_training_config_training_config_type" {
  default = "TFEW_TRAINING_CONFIG"
  description = "fine tuning type "
}
variable "model_description" {
  default = "Custom tuned model"
  description = "Description for the model"
}
variable "finetuned_model_version" {
  default = "0.0"
  description = "fine tuned model version"
}
/*Variables related endpoint*/
variable "create_custom_endpoint" {
  default = true
  description = "set false to disable custom endpoint"
}
variable "endpoint_description" {
  default = "Genai endpoint from custom model"
  description = "Description for endpoint"
}
variable "endpoint_content_moderation_config_is_enabled" {
  default = true
  description = "Set true for content moderation"
}
