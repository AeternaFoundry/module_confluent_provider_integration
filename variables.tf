variable "provider_integrations" {
  description = <<EOT
Map of provider_integrations, attributes below
Required:
    - display_name
    - environment (block):
        - id (required)
Optional:
    - aws (block):
        - customer_role_arn (required)
EOT

  type = map(object({
    display_name = string
    environment = object({
      id = string
    })
    aws = optional(object({
      customer_role_arn = string
    }))
  }))
  # Note: 1 additional provider-side validator is enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

