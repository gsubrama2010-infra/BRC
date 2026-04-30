variable "account_roles" {
  type = map(object({
    name    = string
    comment = optional(string, null)
    parent_role_name = optional(string)
  }))
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

variable "user_role_assignments" {
  type = map(list(string))
  default = {}
}