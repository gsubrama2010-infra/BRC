variable "databases" {
  type = map(object({
    name                        = string
    comment                     = optional(string, null)
    is_transient                = optional(bool, false)
    data_retention_time_in_days = optional(number, 1)
  }))
}