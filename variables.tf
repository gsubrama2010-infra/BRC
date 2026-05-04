variable "warehouses" {
  type = map(object({
    name                                = string
    warehouse_size                      = optional(string, "XSMALL")
    warehouse_type                      = optional(string, "STANDARD")
    auto_suspend                        = optional(number, 300)
    auto_resume                         = optional(bool, true)
    initially_suspended                 = optional(bool, true)
    min_cluster_count                   = optional(number, 1)
    max_cluster_count                   = optional(number, 1)
    scaling_policy                      = optional(string, "STANDARD")
    statement_timeout_in_seconds        = optional(number, 3600)
    statement_queued_timeout_in_seconds = optional(number, 0)
    comment                             = optional(string, null)
  }))
  default = {}
}

variable "databases" {
  type = map(object({
    name                        = string
    comment                     = optional(string, null)
    is_transient                = optional(bool, false)
    data_retention_time_in_days = optional(number, 1)
  }))
  default = {}
}

variable "schemas" {
  type = map(object({
    database                    = string
    name                        = string
    comment                     = optional(string, null)
    is_transient                = optional(bool, false)
    with_managed_access         = optional(bool, false)
    data_retention_time_in_days = optional(number, 1)
  }))
  default = {}
}

variable "account_roles" {
  type = map(object({
    name             = string
    comment          = optional(string, null)
    parent_role_name = string
  }))
  default = {}
}

variable "role_privilege_grants" {
  type = map(object({
    account_role_name = string
    privileges        = list(string)
    with_grant_option = optional(bool, false)

    on_account = optional(bool)

    on_account_object = optional(object({
      object_type = string
      object_name = string
    }))

    on_schema = optional(object({
      schema_name = string
    }))

    on_schema_object = optional(object({
      object_type = optional(string)
      object_name = optional(string)

      all = optional(object({
        object_type_plural = string
        in_database        = optional(string)
        in_schema          = optional(string)
      }))

      future = optional(object({
        object_type_plural = string
        in_database        = optional(string)
        in_schema          = optional(string)
      }))
    }))
  }))
  default = {}
}

variable "ro_parent_role_name" {
  type    = string
  default = null
}

variable "rw_parent_role_name" {
  type    = string
  default = null
}

variable "custom_account_roles" {
  type = map(object({
    name             = string
    comment          = optional(string, null)
    parent_role_name = string
  }))
  default = {}
}

variable "custom_role_privilege_grants" {
  type = map(object({
    account_role_name = string
    privileges        = list(string)
    with_grant_option = optional(bool, false)

    on_account = optional(bool)

    on_account_object = optional(object({
      object_type = string
      object_name = string
    }))

    on_schema = optional(object({
      schema_name = string
    }))

    on_schema_object = optional(object({
      object_type = optional(string)
      object_name = optional(string)

      all = optional(object({
        object_type_plural = string
        in_database        = optional(string)
        in_schema          = optional(string)
      }))

      future = optional(object({
        object_type_plural = string
        in_database        = optional(string)
        in_schema          = optional(string)
      }))
    }))
  }))
  default = {}
}
variable "role_to_role_grants" {
  description = "Map of role-to-role grants: grant role_name to parent_role_name"
  type = map(object({
    role_name        = string
    parent_role_name = string
  }))
  default = {}
}
variable "user_role_assignments" {
  type    = map(list(string))
  default = {}
}