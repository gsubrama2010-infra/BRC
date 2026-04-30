resource "snowflake_schema" "this" {
  for_each = var.schemas

  database                    = each.value.database
  name                        = each.value.name
  comment                     = each.value.comment
  is_transient                = each.value.is_transient
  with_managed_access         = each.value.with_managed_access
  data_retention_time_in_days = each.value.data_retention_time_in_days
}