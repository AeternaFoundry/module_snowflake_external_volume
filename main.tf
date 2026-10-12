resource "snowflake_external_volume" "external_volumes" {
  for_each = var.external_volumes

  name         = each.value.name
  allow_writes = each.value.allow_writes
  comment      = each.value.comment

  dynamic "storage_location" {
    for_each = each.value.storage_location
    content {
      azure_tenant_id              = storage_location.value.azure_tenant_id
      encryption_kms_key_id        = storage_location.value.encryption_kms_key_id
      encryption_type              = storage_location.value.encryption_type
      storage_aws_access_point_arn = storage_location.value.storage_aws_access_point_arn
      storage_aws_external_id      = storage_location.value.storage_aws_external_id
      storage_aws_key_id           = storage_location.value.storage_aws_key_id
      storage_aws_role_arn         = storage_location.value.storage_aws_role_arn
      storage_aws_secret_key       = storage_location.value.storage_aws_secret_key
      storage_base_url             = storage_location.value.storage_base_url
      storage_endpoint             = storage_location.value.storage_endpoint
      storage_location_name        = storage_location.value.storage_location_name
      storage_provider             = storage_location.value.storage_provider
      use_privatelink_endpoint     = storage_location.value.use_privatelink_endpoint
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      read   = timeouts.value.read
      update = timeouts.value.update
    }
  }
}

