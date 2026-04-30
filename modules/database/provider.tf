terraform {
  required_version = ">= 1.5.0"

  required_providers {
    snowflake = {
      source  = "snowflakedb/snowflake"
      version = "~> 2.14"
    }
  }
}
provider "snowflake" {
 organization_name = "MFSG"
 account_name = "MONEYMART_DEV"
 user = "SVC_TERRAFORM"
 private_key = file("rsa_key.p8")
 authenticator = "SNOWFLAKE_JWT"
 role = "MFSG_TERRAFORM_ADMIN"
}