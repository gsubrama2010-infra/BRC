output "warehouse_names" {
  value = { for k, v in snowflake_warehouse.this : k => v.name }
}