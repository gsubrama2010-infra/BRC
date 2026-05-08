terraform {
  required_version = ">= 1.5.0"

  required_providers {
    snowflake = {
      source  = "snowflakedb/snowflake"
      version = "~> 2.14"
    }
  }

  backend "s3" {
    key = "environments/dev/terraform.tfstate"
  }
}

provider "snowflake" {
  organization_name        = var.snowflake_org_name
  account_name             = var.snowflake_account_name
  user                     = var.snowflake_user
  private_key              = file("rsa_key.p8")
  authenticator            = "SNOWFLAKE_JWT"
  role                     = var.snowflake_role
  preview_features_enabled = ["snowflake_table_resource"]
}
