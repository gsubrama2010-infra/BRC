resource "snowflake_tag" "terraform_managed" {
  name     = "TERRAFORM_MANAGED"
  database = "ADMIN_INTEGRATION_DB"
  schema   = "PUBLIC"
  comment  = "Applied to all objects provisioned and managed by Terraform"

  depends_on = [module.databases]
}

resource "snowflake_tag_association" "warehouses" {
  for_each = var.warehouses

  object_type        = "WAREHOUSE"
  object_identifiers = [upper(each.value.name)]
  tag_id             = snowflake_tag.terraform_managed.fully_qualified_name
  tag_value          = "TRUE"

  depends_on = [module.warehouses, snowflake_tag.terraform_managed]
}

resource "snowflake_tag_association" "databases" {
  for_each = var.databases

  object_type        = "DATABASE"
  object_identifiers = [upper(each.value.name)]
  tag_id             = snowflake_tag.terraform_managed.fully_qualified_name
  tag_value          = "TRUE"

  depends_on = [module.databases, snowflake_tag.terraform_managed]
}

resource "snowflake_tag_association" "schemas" {
  for_each = var.schemas

  object_type        = "SCHEMA"
  object_identifiers = ["${upper(each.value.database)}.${upper(each.value.name)}"]
  tag_id             = snowflake_tag.terraform_managed.fully_qualified_name
  tag_value          = "TRUE"

  depends_on = [module.schemas, snowflake_tag.terraform_managed]
}

resource "snowflake_tag_association" "roles" {
  for_each = local.all_account_roles

  object_type        = "ACCOUNT ROLE"
  object_identifiers = [upper(each.value.name)]
  tag_id             = snowflake_tag.terraform_managed.fully_qualified_name
  tag_value          = "TRUE"

  depends_on = [module.account_roles, snowflake_tag.terraform_managed]
}
