# PROD Environment — To be populated from PROD Environment tab
# Use the same module structure as DEV and QA:
#
# module "warehouses" {
#   source = "../../modules/warehouse"
#   warehouses = var.warehouses
# }
#
# module "databases" {
#   source = "../../modules/database"
#   databases = var.databases
# }
#
# module "schemas" {
#   source = "../../modules/schema"
#   schemas = var.schemas
# }
#
# module "account_roles" {
#   source = "../../modules/account_role"
#   account_roles         = local.all_account_roles
#   role_privilege_grants = local.all_role_privilege_grants
#   role_to_role_grants   = var.role_to_role_grants
#   user_role_assignments = var.user_role_assignments
# }
