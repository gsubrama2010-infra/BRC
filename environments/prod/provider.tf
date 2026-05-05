terraform {
  required_version = ">= 1.5.0"

  required_providers {
    snowflake = {
      source  = "snowflakedb/snowflake"
      version = "~> 2.14"
    }
  }

  backend "s3" {
    bucket = "dataeng-env-snowflake-data-2026032700000"
    key    = "environments/prod/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "snowflake" {
  organization_name        = "SPYPLHP"                   # TODO: Update if PROD uses a different org
  account_name             = "REPLACE_WITH_PROD_ACCOUNT" # TODO: Replace with PROD account name
  user                     = "REPLACE_WITH_PROD_USER"    # TODO: Replace with PROD service user
  private_key              = file("rsa_key.p8")
  authenticator            = "SNOWFLAKE_JWT"
  role                     = "ACCOUNTADMIN"
  preview_features_enabled = ["snowflake_table_resource"]
}
