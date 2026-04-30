resource "snowflake_warehouse" "this" {
  for_each = var.warehouses

  name                                = each.value.name
  warehouse_size                      = each.value.warehouse_size
  warehouse_type                      = each.value.warehouse_type
  auto_suspend                        = each.value.auto_suspend
  auto_resume                         = each.value.auto_resume
  initially_suspended                 = each.value.initially_suspended
  min_cluster_count                   = each.value.min_cluster_count
  max_cluster_count                   = each.value.max_cluster_count
  scaling_policy                      = each.value.scaling_policy
  statement_timeout_in_seconds        = each.value.statement_timeout_in_seconds
  statement_queued_timeout_in_seconds = each.value.statement_queued_timeout_in_seconds
  comment                             = each.value.comment
}