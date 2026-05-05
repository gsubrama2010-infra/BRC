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
    key    = "environments/dev/terraform.tfstate"
    region = "us-east-1"
  }
}
provider "snowflake" {
  organization_name        = "SPYPLHP"
  account_name             = "VU59987"
  user                     = "GSUBRAMA"
  private_key              = file("rsa_key.p8")
  authenticator            = "SNOWFLAKE_JWT"
  role                     = "ACCOUNTADMIN"
  preview_features_enabled = ["snowflake_table_resource"]
}
