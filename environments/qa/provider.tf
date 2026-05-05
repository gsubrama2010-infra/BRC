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
    key    = "environments/qa/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "snowflake" {
  organization_name        = "SPYPLHP"                 # TODO: Update if QA uses a different org
  account_name             = "REPLACE_WITH_QA_ACCOUNT" # TODO: Replace with QA account name
  user                     = "REPLACE_WITH_QA_USER"    # TODO: Replace with QA service user
  private_key              = file("rsa_key.p8")
  authenticator            = "SNOWFLAKE_JWT"
  role                     = "ACCOUNTADMIN"
  preview_features_enabled = ["snowflake_table_resource"]
}
