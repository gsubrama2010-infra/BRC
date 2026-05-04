locals {
  schema_metadata = {
    for k, s in var.schemas :
    k => {
      database         = upper(s.database)
      schema_name      = upper(s.name)
      layer_name       = element(split("_", upper(s.database)), length(split("_", upper(s.database))) - 1)
      full_schema_name = "${upper(s.database)}.${upper(s.name)}"
    }
  }

  database_role_metadata = {
    for db in distinct([for s in values(var.schemas) : upper(s.database)]) :
    db => {
      database     = db
      layer_name   = element(split("_", db), length(split("_", db)) - 1)
      ro_role_name = "${db}_RO"
      rw_role_name = "${db}_RW"
    }
  }

  generated_account_roles = merge(
    {
      for k, d in local.database_role_metadata :
      "${k}_ro" => {
        name             = d.ro_role_name
        comment          = "Read-only role for database ${d.database}"
        parent_role_name = "SYSADMIN"
      }
    },
    {
      for k, d in local.database_role_metadata :
      "${k}_rw" => {
        name             = d.rw_role_name
        comment          = "Read-write role for database ${d.database}"
        parent_role_name = "SYSADMIN"
      }
    }
  )

  all_account_roles = merge(
    local.generated_account_roles,
    var.custom_account_roles
  )

  generated_role_privilege_grants = merge(
    # Database usage
    {
      for k, d in local.database_role_metadata :
      "${k}_ro_db_usage" => {
        account_role_name = d.ro_role_name
        privileges        = ["USAGE"]
        on_account_object = {
          object_type = "DATABASE"
          object_name = d.database
        }
      }
    },
    {
      for k, d in local.database_role_metadata :
      "${k}_rw_db_usage" => {
        account_role_name = d.rw_role_name
        privileges        = ["USAGE"]
        on_account_object = {
          object_type = "DATABASE"
          object_name = d.database
        }
      }
    },

    # Current schemas only: use on_schema, not SCHEMAS in on_schema_object
    {
      for k, s in local.schema_metadata :
      "${k}_rw_schema_privileges" => {
        account_role_name = local.database_role_metadata[s.database].rw_role_name
        privileges = [
          "USAGE",
          "CREATE TABLE",
          "CREATE VIEW",
          "CREATE STAGE",
          "CREATE FILE FORMAT",
          "CREATE SEQUENCE",
          "CREATE FUNCTION",
          "CREATE PROCEDURE",
          "CREATE STREAM",
          "CREATE TASK",
          "CREATE PIPE"
        ]
        on_schema = {
          schema_name = s.full_schema_name
        }
      }
    },

    # Tables in database: current + future
    {
      for k, d in local.database_role_metadata :
      "${k}_rw_all_tables_in_database" => {
        account_role_name = d.rw_role_name
        privileges = [
          "SELECT",
          "INSERT",
          "UPDATE",
          "DELETE",
          "TRUNCATE",
          "REFERENCES"
        ]
        on_schema_object = {
          all = {
            object_type_plural = "TABLES"
            in_database        = d.database
          }
        }
      }
    },
    {
      for k, s in local.schema_metadata :
      "${k}_ro_schema_usage" => {
        account_role_name = local.database_role_metadata[s.database].ro_role_name
        privileges        = ["USAGE"]

        on_schema = {
          schema_name = s.full_schema_name
        }
      }
    },
    {
      for k, d in local.database_role_metadata :
      "${k}_ro_future_tables_in_database" => {
        account_role_name = d.ro_role_name
        privileges        = ["SELECT"]

        on_schema_object = {
          future = {
            object_type_plural = "TABLES"
            in_database        = d.database
          }
        }
      }
    },
    {
      for k, d in local.database_role_metadata :
      "${k}_ro_all_tables_in_database" => {
        account_role_name = d.ro_role_name
        privileges        = ["SELECT"]

        on_schema_object = {
          all = {
            object_type_plural = "TABLES"
            in_database        = d.database
          }
        }
      }
    },
    {
      for k, d in local.database_role_metadata :
      "${k}_rw_future_tables_in_database" => {
        account_role_name = d.rw_role_name
        privileges = [
          "SELECT",
          "INSERT",
          "UPDATE",
          "DELETE",
          "TRUNCATE",
          "REFERENCES"
        ]
        on_schema_object = {
          future = {
            object_type_plural = "TABLES"
            in_database        = d.database
          }
        }
      }
    }
  )

  all_role_privilege_grants = merge(
    local.generated_role_privilege_grants,
    var.custom_role_privilege_grants
  )
}