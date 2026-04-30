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
}