output "schema_names" {
  value = {
    for k, v in snowflake_schema.this :
    k => "${v.database}.${v.name}"
  }
}