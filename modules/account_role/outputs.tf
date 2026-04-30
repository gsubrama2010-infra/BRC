output "account_role_names" {
  value = { for k, v in snowflake_account_role.this : k => v.name }
}

output "account_role_parent_grants" {
  value = {
    for k, v in snowflake_grant_account_role.role_to_parent :
    k => {
      role_name        = v.role_name
      parent_role_name = v.parent_role_name
    }
  }
}

output "user_role_assignments" {
  value = {
    for k, v in snowflake_grant_account_role.role_to_user :
    k => {
      role_name = v.role_name
      user_name = v.user_name
    }
  }
}