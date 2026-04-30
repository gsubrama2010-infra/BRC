resource "snowflake_database" "this" {
  for_each = var.databases

  name                        = each.value.name
  comment                     = each.value.comment
  is_transient                = each.value.is_transient
  data_retention_time_in_days = each.value.data_retention_time_in_days
}