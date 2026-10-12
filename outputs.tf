output "external_volumes_id" {
  description = "Map of id values across all external_volumes, keyed the same as var.external_volumes except keys with no id are omitted"
  value       = { for k, v in snowflake_external_volume.external_volumes : k => v.id if v.id != null && length(v.id) > 0 }
}
output "external_volumes_allow_writes" {
  description = "Map of allow_writes values across all external_volumes, keyed the same as var.external_volumes except keys with no allow_writes are omitted"
  value       = { for k, v in snowflake_external_volume.external_volumes : k => v.allow_writes if v.allow_writes != null && length(v.allow_writes) > 0 }
}
output "external_volumes_comment" {
  description = "Map of comment values across all external_volumes, keyed the same as var.external_volumes except keys with no comment are omitted"
  value       = { for k, v in snowflake_external_volume.external_volumes : k => v.comment if v.comment != null && length(v.comment) > 0 }
}
output "external_volumes_describe_output" {
  description = "Map of describe_output values across all external_volumes, keyed the same as var.external_volumes except keys with no describe_output are omitted"
  value       = { for k, v in snowflake_external_volume.external_volumes : k => v.describe_output if v.describe_output != null && length(v.describe_output) > 0 }
}
output "external_volumes_fully_qualified_name" {
  description = "Map of fully_qualified_name values across all external_volumes, keyed the same as var.external_volumes except keys with no fully_qualified_name are omitted"
  value       = { for k, v in snowflake_external_volume.external_volumes : k => v.fully_qualified_name if v.fully_qualified_name != null && length(v.fully_qualified_name) > 0 }
}
output "external_volumes_name" {
  description = "Map of name values across all external_volumes, keyed the same as var.external_volumes except keys with no name are omitted"
  value       = { for k, v in snowflake_external_volume.external_volumes : k => v.name if v.name != null && length(v.name) > 0 }
}
output "external_volumes_show_output" {
  description = "Map of show_output values across all external_volumes, keyed the same as var.external_volumes except keys with no show_output are omitted"
  value       = { for k, v in snowflake_external_volume.external_volumes : k => v.show_output if v.show_output != null && length(v.show_output) > 0 }
}
output "external_volumes_storage_location" {
  description = "Map of storage_location values across all external_volumes, keyed the same as var.external_volumes except keys with no storage_location are omitted"
  value       = { for k, v in snowflake_external_volume.external_volumes : k => v.storage_location if v.storage_location != null && length(v.storage_location) > 0 }
  sensitive   = true
}

