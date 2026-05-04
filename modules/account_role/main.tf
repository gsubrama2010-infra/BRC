resource "snowflake_account_role" "this" {
  for_each = var.account_roles

  name    = each.value.name
  comment = each.value.comment
}

resource "snowflake_grant_account_role" "role_to_parent" {
  for_each = {
    for k, v in var.account_roles :
    k => v if v.parent_role_name != null
  }

  role_name        = snowflake_account_role.this[each.key].name
  parent_role_name = each.value.parent_role_name
}

resource "snowflake_grant_account_role" "role_to_role" {
  for_each = var.role_to_role_grants

  role_name        = each.value.role_name
  parent_role_name = each.value.parent_role_name

  depends_on = [
    snowflake_account_role.this,
    snowflake_grant_account_role.role_to_parent
  ]
}

resource "snowflake_grant_account_role" "role_to_user" {
  for_each = {
    for grant in local.user_role_grants :
    "${upper(grant.user_name)}|${upper(grant.role_name)}" => grant
  }

  role_name = each.value.role_name
  user_name = each.value.user_name

  depends_on = [
    snowflake_account_role.this
  ]
}

# 1) Account-level grants
resource "snowflake_grant_privileges_to_account_role" "on_account" {
  for_each = {
    for k, v in var.role_privilege_grants : k => v
    if try(v.on_account, false) == true
  }

  account_role_name = each.value.account_role_name
  privileges        = each.value.privileges
  with_grant_option = try(each.value.with_grant_option, false)

  on_account = true

  depends_on = [
    snowflake_account_role.this,
    snowflake_grant_account_role.role_to_parent
  ]
}

# 2) Account object grants
resource "snowflake_grant_privileges_to_account_role" "on_account_object" {
  for_each = {
    for k, v in var.role_privilege_grants : k => v
    if try(v.on_account_object, null) != null
  }

  account_role_name = each.value.account_role_name
  privileges        = each.value.privileges
  with_grant_option = try(each.value.with_grant_option, false)

  on_account_object {
    object_type = each.value.on_account_object.object_type
    object_name = each.value.on_account_object.object_name
  }

  depends_on = [
    snowflake_account_role.this,
    snowflake_grant_account_role.role_to_parent
  ]
}

# 3) Schema grants
resource "snowflake_grant_privileges_to_account_role" "on_schema" {
  for_each = {
    for k, v in var.role_privilege_grants : k => v
    if try(v.on_schema, null) != null
  }

  account_role_name = each.value.account_role_name
  privileges        = each.value.privileges
  with_grant_option = try(each.value.with_grant_option, false)

  on_schema {
    schema_name = each.value.on_schema.schema_name
  }

  depends_on = [
    snowflake_account_role.this,
    snowflake_grant_account_role.role_to_parent
  ]
}

# 4) Schema object grants
resource "snowflake_grant_privileges_to_account_role" "on_schema_object" {
  for_each = {
    for k, v in var.role_privilege_grants : k => v
    if try(v.on_schema_object, null) != null
  }

  account_role_name = each.value.account_role_name
  privileges        = each.value.privileges
  with_grant_option = try(each.value.with_grant_option, false)

  on_schema_object {
    object_type = try(each.value.on_schema_object.object_type, null)
    object_name = try(each.value.on_schema_object.object_name, null)

    dynamic "all" {
      for_each = try(each.value.on_schema_object.all, null) == null ? [] : [each.value.on_schema_object.all]
      content {
        object_type_plural = all.value.object_type_plural
        in_database        = try(all.value.in_database, null)
        in_schema          = try(all.value.in_schema, null)
      }
    }

    dynamic "future" {
      for_each = try(each.value.on_schema_object.future, null) == null ? [] : [each.value.on_schema_object.future]
      content {
        object_type_plural = future.value.object_type_plural
        in_database        = try(future.value.in_database, null)
        in_schema          = try(future.value.in_schema, null)
      }
    }
  }

  depends_on = [
    snowflake_account_role.this,
    snowflake_grant_account_role.role_to_parent
  ]
}