resource "confluent_provider_integration" "provider_integrations" {
  for_each = var.provider_integrations

  display_name = each.value.display_name

  environment {
    id = each.value.environment.id
  }

  dynamic "aws" {
    for_each = each.value.aws != null ? [each.value.aws] : []
    content {
      customer_role_arn = aws.value.customer_role_arn
    }
  }
}

