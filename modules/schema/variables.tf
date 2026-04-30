variable "schemas" {
  type = map(object({
    database                    = string
    name                        = string
    comment                     = optional(string, null)
    is_transient                = optional(bool, false)
    with_managed_access         = optional(bool, false)
    data_retention_time_in_days = optional(number, 1)
  }))
}