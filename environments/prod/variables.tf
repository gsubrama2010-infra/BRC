variable "snowflake_org_name" {
  description = "Snowflake organization name"
  type        = string
  sensitive   = true
}

variable "snowflake_account_name" {
  description = "Snowflake account name"
  type        = string
  sensitive   = true
}

variable "snowflake_user" {
  description = "Snowflake username for Terraform"
  type        = string
  sensitive   = true
}

variable "snowflake_role" {
  description = "Snowflake role for Terraform operations"
  type        = string
}

variable "snowflake_private_key_passphrase" {
  description = "Passphrase for the encrypted Snowflake RSA private key"
  type        = string
  sensitive   = true
}
