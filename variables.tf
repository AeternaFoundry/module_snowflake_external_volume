variable "external_volumes" {
  description = <<EOT
Map of external_volumes, attributes below
Required:
    - name
    - storage_location (block):
        - azure_tenant_id (optional)
        - encryption_kms_key_id (optional)
        - encryption_type (optional)
        - storage_aws_access_point_arn (optional)
        - storage_aws_external_id (optional)
        - storage_aws_key_id (optional)
        - storage_aws_role_arn (optional)
        - storage_aws_secret_key (optional)
        - storage_base_url (required)
        - storage_endpoint (optional)
        - storage_location_name (required)
        - storage_provider (required)
        - use_privatelink_endpoint (optional)
Optional:
    - allow_writes
    - comment
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - read (optional)
        - update (optional)
EOT

  type = map(object({
    name         = string
    allow_writes = optional(string)
    comment      = optional(string)
    storage_location = list(object({
      azure_tenant_id              = optional(string)
      encryption_kms_key_id        = optional(string)
      encryption_type              = optional(string)
      storage_aws_access_point_arn = optional(string)
      storage_aws_external_id      = optional(string)
      storage_aws_key_id           = optional(string)
      storage_aws_role_arn         = optional(string)
      storage_aws_secret_key       = optional(string)
      storage_base_url             = string
      storage_endpoint             = optional(string)
      storage_location_name        = string
      storage_provider             = string
      use_privatelink_endpoint     = optional(string)
    }))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      read   = optional(string)
      update = optional(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.external_volumes : (
        length(v.storage_location) >= 1
      )
    ])
    error_message = "Each storage_location list must contain at least 1 items"
  }
}

